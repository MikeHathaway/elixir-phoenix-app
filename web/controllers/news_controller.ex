defmodule ElixirWebApp.NewsController do
  use ElixirWebApp.Web, :controller

  def getStaticNews(conn, _params) do
    news = [
      %{site: "The New York Times",
        url: "https://www.nytimes.com/"
      }
    ]
    json conn, news
  end

  # url = "https://newsapi.org/v1/articles?source=" <> params <> "&apiKey=" <> apiKey
  # default Param: // "techcrunch"

  def getExternalNews(conn, %{"source" => source}) do
    json conn, fetchNews(source)
  end

  defp fetchNews(source) do
    api_endpoint(source)
    |> HTTPoison.get
    |> handle_json
    |> Tuple.to_list
    # |> Poison.encode!
    #|> insert_article #adds returned articles to the database
  end

  defp api_endpoint(source) do
    "https://newsapi.org/v1/articles?source=#{source}&apiKey=1e710731cf2241bdb53b92210117782c"
  end

  defp handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  defp insert_article({:ok, }) do

  end

  # defp insert_article(articles) do
  #   mapped_articles = Enum.each(articles, fn (article) ->  %ElixirWebApp.Article{article: article} end)
  #   IO.puts mapped_articles
  #   Enum.each(mapped_articles, fn (article) -> ElixirWebApp.Repo.insert(article) end)
  # end

end
