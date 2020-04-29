defmodule Efood.User do
  @moduledoc """
  Schema for Users.\n
  Fields:\n
    -email\n
    -provider\n
    -token
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  @doc """
  Validates required fields:\n
    -email\n
    -provider\n
    -token
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
