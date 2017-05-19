defmodule ElixirWebApp.Repo.Migrations.Articles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :urlToImage, :string
      add :url, :string
      add :title, :string
      # add :publishedAt, :utc_datetime
      add :descrption, :string
      add :author, :string
    end
  end
end
