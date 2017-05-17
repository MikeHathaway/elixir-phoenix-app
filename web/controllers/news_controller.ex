defmodule ElixirWebApp.NewsController do
  use ElixirWebApp.Web, :controller

  def retreiveNews(conn, _params) do
    news = [
      %{site: "The New York Times",
        url: "https://www.nytimes.com/"
      },
    ]

    json conn, news
  end

end
