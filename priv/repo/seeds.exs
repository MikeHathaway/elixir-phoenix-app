# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirWebApp.Repo.insert!(%ElixirWebApp.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.




alias ElixirWebApp.{Repo, News}

[
  %{
    id: 1,
    site: "New York Times",
    url: "https://www.nytimes.com/"
  },
]
|> Enum.map(&News.changeset(%News{}, &1))
|> Enum.each(&Repo.insert!(&1))
