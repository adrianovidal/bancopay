defmodule Bancopay do
  alias Bancopay.Users.Create, as: UserCreate

  alias Bancopay.Account.{Deposit, Withdraw, Transactions}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call

  defdelegate withdraw(params), to: Withdraw, as: :call

  defdelegate transaction(params), to: Transactions, as: :call
end
