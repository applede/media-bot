defmodule MediaBot.PageController do
  use MediaBot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
