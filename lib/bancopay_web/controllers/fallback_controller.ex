defmodule BancopayWeb.FallbackController do
  use BancopayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BancopayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
