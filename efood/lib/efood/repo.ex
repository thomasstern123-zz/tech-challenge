defmodule Efood.Repo do
  use Ecto.Repo,
    otp_app: :efood,
    adapter: Ecto.Adapters.Postgres
end
