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

# Products with factors
# for _ <- 0..10 do
#   product =
#     Repo.insert!(%Product{
#       name: Faker.Commerce.En.product_name_product()
#     })

#   Repo.insert!(%Factor{
#     name: "Dureza",
#     value: Faker.random_between(1, 10),
#     weighing: Faker.random_between(1, 10),
#     product_id: product.id
#   })

#   Repo.insert!(%Factor{
#     name: "Humedad",
#     value: Faker.random_between(1, 10),
#     weighing: Faker.random_between(1, 10),
#     product_id: product.id
#   })

#   Repo.insert!(%Factor{
#     name: "Maleabilidad",
#     value: Faker.random_between(1, 10),
#     weighing: Faker.random_between(1, 10),
#     product_id: product.id
#   })

#   Repo.insert!(%Factor{
#     name: "Consistencia",
#     value: Faker.random_between(1, 10),
#     weighing: Faker.random_between(1, 10),
#     product_id: product.id
#   })
# end

# # Providers
# provider1 =
#   with {:ok, provider} <-
#          MvpApi.Providers.create_provider(%{
#            "name" => "ACINOX",
#            "location" => "La Lisa",
#            "distance_km" => 25
#          }) do
#     provider
#   end

# provider2 =
#   with {:ok, provider} <-
#          MvpApi.Providers.create_provider(%{
#            "name" => "Industria polígráfica",
#            "location" => "Cerro",
#            "distance_km" => 12
#          }) do
#     provider
#   end

# # Processes
# process =
#   Repo.insert!(%Process{
#     name: "Produccion de dulces finos",
#     description: "Proceso para producir dulces en una fabrica"
#   })

# # Providers on processes
# process_provider1 =
#   Repo.insert!(%ProcessProvider{
#     number_supplies_year: 280,
#     tons_by_supplies: 3.0,
#     goods_type: "Leche fluida",
#     transportation_mode: :automotor,
#     provider_id: provider1.id,
#     process_id: process.id
#   })

# process_provider2 =
#   Repo.insert!(%ProcessProvider{
#     number_supplies_year: 25,
#     tons_by_supplies: 10.0,
#     goods_type: "Leche en polvo",
#     transportation_mode: :automotor,
#     provider_id: provider2.id,
#     process_id: process.id
#   })

# # Provider evaluations
# Repo.insert!(%ProviderEvaluation{
#   credit: 5,
#   credit_weighing: 10,
#   punctuality: 3,
#   punctuality_weighing: 30,
#   quality: 4,
#   quality_weighing: 40,
#   quantity: 5,
#   quantity_weighing: 10,
#   relations: 4,
#   relations_weighing: 10,
#   process_provider_id: process_provider1.id
# })

# Repo.insert!(%ProviderEvaluation{
#   credit: 4,
#   credit_weighing: 10,
#   punctuality: 4,
#   punctuality_weighing: 30,
#   quality: 3,
#   quality_weighing: 40,
#   quantity: 4,
#   quantity_weighing: 10,
#   relations: 5,
#   relations_weighing: 10,
#   process_provider_id: process_provider2.id
# })

# # Transportation schemas for providers on a process
# Repo.insert!(%TransportationSchema{
#   using_own: 20,
#   using_provider: 80,
#   using_third: 0,
#   process_provider_id: process_provider1.id
# })

# Repo.insert!(%TransportationSchema{
#   using_own: 0,
#   using_provider: 0,
#   using_third: 100,
#   process_provider_id: process_provider2.id
# })

# # Innovation projects
# Knowledge.create_innovation_project(%{
#   name: "Proyecto de tratamiento térmico",
#   objective: "Mejorar calidad",
#   expected_result: "Nueva tecnología",
#   budget: Money.new(:CUP, 30_000),
#   term: 2.5,
#   expected_annual_effect: Money.new(:CUP, 6500),
#   observation: "El proyecto esta bueno"
# })

# Knowledge.create_innovation_project(%{
#   name: "Proyecto forja en caliente",
#   objective: "Mejorar calidad",
#   expected_result: "Nueva tecnología",
#   budget: Money.new(:CUP, 7800),
#   term: 2,
#   expected_annual_effect: Money.new(:CUP, 1200),
#   observation: "El proyecto es de forja en caliente"
# })

# # Intangible fixed assets list
# Knowledge.create_intangible_fixed_asset(%{"name" => "Software"})
# Knowledge.create_intangible_fixed_asset((%{"name" => "Patentes"}))
# Knowledge.create_intangible_fixed_asset((%{"name" => "Registros de marcas"}))
# Knowledge.create_innovation_project(%{"name" => "Derechos de autor"})
# Knowledge.create_innovation_project(%{"name" => "Registros de modelos industriales"})
# Knowledge.create_innovation_project(%{"name" => "Registro de sistemas organizacionales"})
# Knowledge.create_innovation_project(%{"name" => "Registros de procedimientos"})
# Knowledge.create_innovation_project(%{"name" => "Otros elementos de la propiedad intelectual"})

# # Users
# Accounts.register_user(%{
#   "email" => "manuelmenendezalfonso@gmail.com",
#   "password" => "123qweasdzxc"
# })

# Accounts.register_user(%{"email" => "daniel@gmail.com", "password" => "123qweasdzxc"})
# Accounts.register_user(%{"email" => "monteagudo@gmail.com", "password" => "123qweasdzxc"})

# Intangible fixed assets list
Knowledge.create_intangible_fixed_asset(%{"name" => "Software"})
Knowledge.create_intangible_fixed_asset((%{"name" => "Patentes"}))
Knowledge.create_intangible_fixed_asset((%{"name" => "Registros de marcas"}))
Knowledge.create_intangible_fixed_asset(%{"name" => "Derechos de autor"})
Knowledge.create_intangible_fixed_asset(%{"name" => "Registros de modelos industriales"})
Knowledge.create_intangible_fixed_asset(%{"name" => "Registro de sistemas organizacionales"})
Knowledge.create_intangible_fixed_asset(%{"name" => "Registros de procedimientos"})
Knowledge.create_intangible_fixed_asset(%{"name" => "Otros elementos de la propiedad intelectual"})
