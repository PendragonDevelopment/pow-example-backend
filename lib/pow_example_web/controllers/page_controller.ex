defmodule PowExampleWeb.PageController do
  use PowExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
