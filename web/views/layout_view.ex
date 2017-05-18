defmodule ElixirWebApp.LayoutView do
  use ElixirWebApp.Web, :view

  def article do
    # ElixirWebApp.NewsController.getExternalNews("techcrunch").articles
    "Externally retreived articles will go here!"
  end

end
