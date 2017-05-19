defmodule ElixirWebApp.PageController do
  use ElixirWebApp.Web, :controller

  def index(conn, _params) do
    render conn, "article_index.html"
  end

  def edit(conn, _params) do
    render conn, "edit.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def show(conn, _params) do
    render conn, "single_article.html"
  end

  # Inspired by:
    # https://medium.com/@paulfedory/how-and-why-to-store-images-in-your-database-with-elixir-eb80133eb945
  def create(conn, %{"article" => params}) do
    # changeset = Article.changeset(%Article{}, params)
    # case Repo.insert(changeset) do
    #   {:ok, article} ->
    #     render conn, "article_index.html"
    #   {:error, changeset} ->
    #     render conn, "new.html", changeset: changeset
    # end
  end

  def update(conn, _params) do
    render conn, "update_article.html"
  end

  def delete(conn, _params) do
    render conn, "delete_article.html"
  end

end
