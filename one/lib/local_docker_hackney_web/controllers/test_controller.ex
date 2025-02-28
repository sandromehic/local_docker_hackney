defmodule LocalDockerHackneyWeb.TestController do
  use LocalDockerHackneyWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(:ok, "OK")
  end
end
