defmodule ElixirWebApp.ArticleController do
  use ElixirWebApp.Web, :controller

  # covers the predefined CRUD routes from resources on router.ex
  # may want to change this to a users controller, which provides a customized article feed

  def index(conn, _params) do
    IO.puts "heyoooo"
    render conn, "article_index.html"
  end

  def edit(conn, _params) do
    render conn, "article_index.html"
  end

end
