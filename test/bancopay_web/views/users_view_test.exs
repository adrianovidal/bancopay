defmodule BancopayWeb.UsersViewTest do
  use BancopayWeb.ConnCase, async: true

  import Phoenix.View

  alias Bancopay.{Account, User}
  alias BancopayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Adriano",
      password: "123456",
      nickname: "vidal",
      email: "adriano@email.com",
      age: 36
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Bancopay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Adriano",
        nickname: "vidal"
      }
    }

    assert response == expected_response
  end
end
