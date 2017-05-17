defmodule ElixirWebApp.PageController do
  use ElixirWebApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def testPage(conn, _params) do
    render conn, "testPage.html"
  end
end
