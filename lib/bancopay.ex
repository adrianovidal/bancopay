defmodule Bancopay do
  alias Bancopay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
