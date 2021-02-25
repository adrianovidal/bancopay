defmodule BancopayWeb.AccountsController do
  use BancopayWeb, :controller

  alias Bancopay.Account
  alias Bancopay.Account.Transactions.Response, as: TransactionResponse

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Bancopay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("updadte.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Bancopay.withdraw(params) do
      conn
      |> put_status(:created)
      |> render("updadte.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Bancopay.transaction(params) do
      conn
      |> put_status(:created)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
