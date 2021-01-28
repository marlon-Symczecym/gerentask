defmodule GerentaskWeb.PageController do
  use GerentaskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
