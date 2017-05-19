defmodule ElixirWebApp.PageController do
  use ElixirWebApp.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:articles, Repo.all(ElixirWebApp.Article))
    |> render("article_index.html")
  end

  def edit(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    conn
    |> assign(:article, Repo.get(ElixirWebApp.Article, id))
    |> render("edit.html")
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    conn
    |> assign(:article, Repo.get(ElixirWebApp.Article, id))
    |> render("single_article.html")
  end

  def create(conn, %{"article" => %{"urlToImage" => urlToImage, "url" => url, "title" => title, "description" => description, "author" => author}}) do
    new_article = %ElixirWebApp.Article{urlToImage: urlToImage, url: url, title: title, description: description, author: author}
    Repo.insert(new_article)
    redirect conn, to: page_path(conn, :index)
  end

  def update(conn, %{"id" => id, "article" => %{"urlToImage" => urlToImage, "url" => url, "title" => title, "description" => description, "author" => author}}) do
    {id, _} = Integer.parse(id)
    curr_article = Repo.get(ElixirWebApp.Article, id)
    curr_article = %{curr_article | urlToImage: urlToImage, url: url, title: title, description: description, author: author}
    Repo.update(curr_article)
    redirect conn, to: page_path(conn, :show, curr_article.id)
  end

  def delete(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    article = Repo.get(ElixirWebApp.Article, id)
    Repo.delete(article)
    redirect conn, to: page_path(conn, :index)
  end

end
