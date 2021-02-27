defmodule Bancopay.Users.CreateTest do
  use Bancopay.DataCase, async: true

  alias Bancopay.User
  alias Bancopay.Users.Create

  describe "call/1" do
    test  "when all params are valid, returns an user" do
      params = %{
        name: "Adriano",
        password: "123456",
        nickname: "vidal",
        email: "adriano@email.com",
        age: 36
      }
      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Adriano", age: 36, id: ^user_id} = user
    end

    test  "when there are invalid params, returns an error" do
      params = %{
        name: "Adriano",
        nickname: "vidal",
        email: "adriano@email.com",
        age: 15
      }
      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
