defmodule BancopayWeb.AccountsController do
  use BancopayWeb, :controller

  alias Bancopay.Account
  alias Bancopay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback BancopayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Bancopay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Bancopay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Bancopay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
