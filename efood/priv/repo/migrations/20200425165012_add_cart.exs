defmodule Efood.Repo.Migrations.AddCart do
  @moduledoc """
  This migration created the cart table with the following fields:\n
    -product_name\n
    -product_quantity
  """

  use Ecto.Migration

  def change do
    create table(:cart) do
      add :product_name, :string
      add :product_quantity, :integer

      timestamps
    end
  end
end
