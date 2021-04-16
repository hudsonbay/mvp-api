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
alias MvpApi.Providers.Provider
alias MvpApi.Processes.Process
alias MvpApi.Providers.ProcessProvider
alias MvpApi.Providers.ProviderEvaluation

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
  Repo.insert!(%Provider{
    name: "ACINOX",
    location: "La Lisa",
    distance_km: 25
  })

provider2 =
  Repo.insert!(%Provider{
    name: "Industria polígráfica",
    location: "Cerro",
    distance_km: 12
  })

# Processes
process =
  Repo.insert!(%Process{
    name: "Produccion de dulces finos",
    description: "Proceso para producir dulces en una fabrica"
  })

# Providers on processes
process_provider1 = Repo.insert!(%ProcessProvider{
  number_supplies_year: 280,
  tons_by_supplies: 3.0,
  goods_type: "Leche fluida",
  transportation_mode: :automotor,
  provider_id: provider1.id,
  process_id: process.id
})

process_provider2 = Repo.insert!(%ProcessProvider{
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

# Users
Accounts.register_user(%{"email" => "manuelmenendezalfonso@gmail.com", "password" => "123qweasdzxc"})
Accounts.register_user(%{"email" => "daniel@gmail.com", "password" => "123qweasdzxc"})
Accounts.register_user(%{"email" => "monteagudo@gmail.com", "password" => "123qweasdzxc"})
