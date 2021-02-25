defmodule BancopayWeb.AccountsView do

  alias Bancopay.Account
  alias Bancopay.Account.Transactions.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance changed successfully",
        account: %{
          id: account_id,
          balance: balance
        }
    }
  end

  def render("transaction.json", %TransactionResponse{to_account: to_account, from_account: from_account}) do
    %{
      message: "Transaction done successfully",
      transaction: %{
        from_account: %{
          id: to_account.id,
          balance: to_account.balance
        }
      },
      to_account: %{
        id: from_account.id,
        balance: from_account.balance
      }
    }
  end
end
