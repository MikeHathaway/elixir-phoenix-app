defmodule ElixirWebApp.News do
  use ElixirWebApp.Web, :model
  use Ecto.Schema, :model

  defstruct [:id, :site, :url, :description]

  # schema "news" do
  #   field :id, :integer
  #   field :site, :string
  #   field :url, :string
  #   field :descrption, :string
  # end
  #
  #

end
