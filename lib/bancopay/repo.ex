defmodule Bancopay.Repo do
  use Ecto.Repo,
    otp_app: :bancopay,
    adapter: Ecto.Adapters.Postgres
end
