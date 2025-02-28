defmodule LocalDockerHackneyWeb.Router do
  use LocalDockerHackneyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LocalDockerHackneyWeb do
    pipe_through :api

    get "/", TestController, :index
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:local_docker_hackney, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
