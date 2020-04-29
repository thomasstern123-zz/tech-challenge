defmodule Efood.Repo do
  @moduledoc """
  Module for implementing Ecto.Repo for Postgres
  """
  use Ecto.Repo,
    otp_app: :efood,
    adapter: Ecto.Adapters.Postgres
end
