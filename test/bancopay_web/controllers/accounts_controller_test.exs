defmodule BancopayWeb.AccountsControllerTest do
  use BancopayWeb.ConnCase, async: true

  alias Bancopay.{Account, User}

  #DEPOSIT TEST
  describe "deposit/2" do
    setup %{conn: conn} do
      {:ok, %User{account: %Account{id: account_id}}} = Bancopay.create_user(create_user_to())

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
                "account" => %{"balance" => "50.00", "id" => _id},
                "message" => "Ballance changed successfully"
              } = response
    end

    test "when there are invalid params, returns a error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

        expected_response =  %{"message" => "Invalid deposit value!"}

        assert response == expected_response
    end

    test "when there are invalid account, returns a error", %{conn: conn, account_id: _account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, "aa20cbe2-b01f-4afd-a987-8b3500c4be88", params))
        |> json_response(:bad_request)

        expected_response =  %{"message" => "Account not found!"}

        assert response == expected_response
    end
  end

  #WITHDRAW TEST
  describe "withdraw/2" do
    setup %{conn: conn} do
      {:ok, %User{account: %Account{id: account_id}}} = Bancopay.create_user(create_user_from())

      deposit_params = %{"id" => account_id, "value" => "50.00"}
      {:ok, %Account{id: account_id}} = Bancopay.deposit(deposit_params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "10.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:ok)

      assert %{
                "account" => %{"balance" => "40.00", "id" => _id},
                "message" => "Ballance changed successfully"
              } = response
    end

    test "when there are invalid params, returns a error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

        expected_response =  %{"message" => "Invalid deposit value!"}

        assert response == expected_response
    end
  end

  defp create_user_to, do: %{name: "Adriano", password: "123456", nickname: "vidal", email: "adriano@email.com", age: 36}

  defp create_user_from, do: %{name: "João", password: "654321", nickname: "joao", email: "joao@email.com", age: 22}
end
