# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hydra.Repo.insert!(%Hydra.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Hydra.Repo.insert!(%Hydra.Stores.Store{
  name: "Swap",
  description: "Swap é a máquina white label de criar fintechs em poucos dias. ",
  lat: -23.585289979339343,
  email: "abobora@123",
  lng: -46.67357717366849
})

Hydra.Repo.insert!(%Hydra.Stores.Store{
  name: "Sol Facil",
  description:
    "A Solfácil é uma plataforma tecnológica para financiamento de energia solar feita para você, integrador ",
  lat: -23.564952023888395,
  email: "abobora@123",
  lng: -46.69231000929614
})
