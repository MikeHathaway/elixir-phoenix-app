defmodule ElixirWebApp.Article do
  use Ecto.Schema

  schema "articles" do
    field :urlToImage, :string
    field :url, :string
    field :title, :string
    # field :publishedAt, :utc_datetime
    field :descrption, :string
    field :author, :string
  end
end
