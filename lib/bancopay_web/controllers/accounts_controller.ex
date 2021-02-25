defmodule BancopayWeb.AccountsController do
  use BancopayWeb, :controller

  alias Bancopay.Account

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Bancopay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("updadte.json", account: account)
    end
  end
end
