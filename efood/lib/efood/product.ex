defmodule Efood.Product do
  @moduledoc """
  Schema for Products.\n
  Fields:\n
    -product_name\n
    -categories\n
    -url
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_name, :string
    field :categories, :string
    field :url, :string
  end

  @doc """
  Validates required fields:\n
    -product_name
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_name, :categories, :url])
    |> validate_required([:product_name])
  end
end
