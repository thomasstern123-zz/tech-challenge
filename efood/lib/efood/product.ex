defmodule Efood.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_name, :string
    field :categories, :string
    field :url, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_name, :categories, :url])
    |> validate_required([:product_name])
  end

end
