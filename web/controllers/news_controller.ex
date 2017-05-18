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

  def getExternalNews(conn, _params) do
    json conn, fetchNews()
  end

  defp fetchNews() do
    api_endpoint()
    |> HTTPoison.get
    |> handle_json
    |> Tuple.to_list
    |> Poison.encode!
  end

  defp handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  defp api_endpoint() do
    "https://newsapi.org/v1/articles?source=techcrunch&apiKey=1e710731cf2241bdb53b92210117782c"
  end

end
