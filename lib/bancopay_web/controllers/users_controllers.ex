defmodule BancopayWeb.UsersController do
  use BancopayWeb, :controller

  alias Bancopay.User

  action_fallback BancopayWeb.FallabckController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Bancopay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
