# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MvpApi.Repo.insert!(%MvpApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias MvpApi.Repo

Faker.start()

alias MvpApi.Client.{Product, Factor}
alias MvpApi.Accounts
alias MvpApi.Processes.Process
alias MvpApi.Providers.{ProcessProvider, ProviderEvaluation, TransportationSchema}
alias MvpApi.Knowledge
alias MvpApi.Knowledge.{IntangibleFixedAsset}
alias MvpApi.Entities.Country

# Countries
with {:ok, body} <- "priv/repo/seeds/countries.json" |> Path.expand() |> File.read() do
  Poison.decode!(body, as: [%Country{}])
  |> Enum.each(fn x -> Repo.insert!(x) end)
end

# Products with factors
for _ <- 0..10 do
  product =
    Repo.insert!(%Product{
      name: Faker.Commerce.En.product_name_product()
    })

  Repo.insert!(%Factor{
    name: "Dureza",
    value: Faker.random_between(1, 10),
    weighing: Faker.random_between(1, 10),
    product_id: product.id
  })

  Repo.insert!(%Factor{
    name: "Humedad",
    value: Faker.random_between(1, 10),
    weighing: Faker.random_between(1, 10),
    product_id: product.id
  })

  Repo.insert!(%Factor{
    name: "Maleabilidad",
    value: Faker.random_between(1, 10),
    weighing: Faker.random_between(1, 10),
    product_id: product.id
  })

  Repo.insert!(%Factor{
    name: "Consistencia",
    value: Faker.random_between(1, 10),
    weighing: Faker.random_between(1, 10),
    product_id: product.id
  })
end

# Providers
provider1 =
  with {:ok, provider} <-
         MvpApi.Providers.create_provider(%{
           "name" => "ACINOX",
           "location" => "La Lisa",
           "distance_km" => 25
         }) do
    provider
  end

provider2 =
  with {:ok, provider} <-
         MvpApi.Providers.create_provider(%{
           "name" => "Industria polígráfica",
           "location" => "Cerro",
           "distance_km" => 12
         }) do
    provider
  end

# Processes
process =
  Repo.insert!(%Process{
    name: "Produccion de dulces finos",
    description: "Proceso para producir dulces en una fabrica"
  })

# Providers on processes
process_provider1 =
  Repo.insert!(%ProcessProvider{
    number_supplies_year: 280,
    tons_by_supplies: 3.0,
    goods_type: "Leche fluida",
    transportation_mode: :automotor,
    provider_id: provider1.id,
    process_id: process.id
  })

process_provider2 =
  Repo.insert!(%ProcessProvider{
    number_supplies_year: 25,
    tons_by_supplies: 10.0,
    goods_type: "Leche en polvo",
    transportation_mode: :automotor,
    provider_id: provider2.id,
    process_id: process.id
  })

# Provider evaluations
Repo.insert!(%ProviderEvaluation{
  credit: 5,
  credit_weighing: 10,
  punctuality: 3,
  punctuality_weighing: 30,
  quality: 4,
  quality_weighing: 40,
  quantity: 5,
  quantity_weighing: 10,
  relations: 4,
  relations_weighing: 10,
  process_provider_id: process_provider1.id
})

Repo.insert!(%ProviderEvaluation{
  credit: 4,
  credit_weighing: 10,
  punctuality: 4,
  punctuality_weighing: 30,
  quality: 3,
  quality_weighing: 40,
  quantity: 4,
  quantity_weighing: 10,
  relations: 5,
  relations_weighing: 10,
  process_provider_id: process_provider2.id
})

# Transportation schemas for providers on a process
Repo.insert!(%TransportationSchema{
  using_own: 20,
  using_provider: 80,
  using_third: 0,
  process_provider_id: process_provider1.id
})

Repo.insert!(%TransportationSchema{
  using_own: 0,
  using_provider: 0,
  using_third: 100,
  process_provider_id: process_provider2.id
})

# Innovation projects
Knowledge.create_innovation_project(%{
  name: "Proyecto de tratamiento térmico",
  objective: "Mejorar calidad",
  expected_result: "Nueva tecnología",
  budget: Money.new(:CUP, 30_000),
  term: 2.5,
  expected_annual_effect: Money.new(:CUP, 6500),
  observation: "El proyecto esta bueno"
})

Knowledge.create_innovation_project(%{
  name: "Proyecto forja en caliente",
  objective: "Mejorar calidad",
  expected_result: "Nueva tecnología",
  budget: Money.new(:CUP, 7800),
  term: 2,
  expected_annual_effect: Money.new(:CUP, 1200),
  observation: "El proyecto es de forja en caliente"
})

# Intangible fixed assets list
ifa3 = Repo.insert!(%IntangibleFixedAsset{name: "Software"})
ifa2 = Repo.insert!(%IntangibleFixedAsset{name: "Patentes"})
ifa1 = Repo.insert!(%IntangibleFixedAsset{name: "Registros de marcas"})
Repo.insert!(%IntangibleFixedAsset{name: "Derechos de autor"})
Repo.insert!(%IntangibleFixedAsset{name: "Registros de modelos industriales"})
Repo.insert!(%IntangibleFixedAsset{name: "Registro de sistemas organizacionales"})
ifa4 = Repo.insert!(%IntangibleFixedAsset{name: "Registros de procedimientos"})
Repo.insert!(%IntangibleFixedAsset{name: "Otros elementos de la propiedad intelectual"})

Knowledge.create_intangible_fixed_asset_process(%{
  "amount" => 1,
  "dedicated_percentage" => Decimal.new(100),
  "initial_value" => Money.new(:CUP, 23_000),
  "depreciation_rate" => Decimal.new(30),
  "process_id" => process.id,
  "intangible_fixed_asset_id" => ifa1.id
})

Knowledge.create_intangible_fixed_asset_process(%{
  "amount" => 1,
  "dedicated_percentage" => Decimal.new(50),
  "initial_value" => Money.new(:CUP, 27_800),
  "depreciation_rate" => Decimal.new(20),
  "process_id" => process.id,
  "intangible_fixed_asset_id" => ifa2.id
})

Knowledge.create_intangible_fixed_asset_process(%{
  "amount" => 2,
  "dedicated_percentage" => Decimal.new(35),
  "initial_value" => Money.new(:CUP, 35_000),
  "depreciation_rate" => Decimal.new(20),
  "process_id" => process.id,
  "intangible_fixed_asset_id" => ifa3.id
})

Knowledge.create_intangible_fixed_asset_process(%{
  "amount" => 1,
  "dedicated_percentage" => Decimal.new(100),
  "initial_value" => Money.new(:CUP, 23_560),
  "depreciation_rate" => Decimal.new(30),
  "process_id" => process.id,
  "intangible_fixed_asset_id" => ifa4.id
})

# Users
Accounts.register_user(%{
  "email" => "manuelmenendezalfonso@gmail.com",
  "password" => "123qweasdzxc"
})

Accounts.register_user(%{"email" => "daniel@gmail.com", "password" => "123qweasdzxc"})
Accounts.register_user(%{"email" => "monteagudo@gmail.com", "password" => "123qweasdzxc"})
