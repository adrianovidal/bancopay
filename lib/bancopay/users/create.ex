defmodule Bancopay.Users.Create do
  alias Bancopay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
