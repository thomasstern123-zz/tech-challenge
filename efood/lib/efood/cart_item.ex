defmodule Efood.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart" do
    field :product_name, :string
    field :product_quantity, :integer, default: 0

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_name, :product_quantity])
    |> validate_required([:product_name, :product_quantity])
  end
end
