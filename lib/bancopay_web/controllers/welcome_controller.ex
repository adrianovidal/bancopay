defmodule BancopayWeb.WelcomeController do
  use BancopayWeb, :controller

  alias Bancopay.Numbers

  def index(conn, %{"filename"=>filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handler_response(conn)
  end

  defp handler_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Bancopay API. Here is your number #{result}"})
  end

  defp handler_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
