defmodule Efood.CartItem do
  @moduledoc """
  Schema for Items in the Cart.\n
  Fields:\n
    -product_name\n
    -product_quantity\n
  TODO: make use of the product_quantity field
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "cart" do
    field :product_name, :string
    field :product_quantity, :integer, default: 0

    timestamps()
  end

  @doc """
  Validates required fields:\n
    -product_name\n
    -product_quantity
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_name, :product_quantity])
    |> validate_required([:product_name, :product_quantity])
  end
end
