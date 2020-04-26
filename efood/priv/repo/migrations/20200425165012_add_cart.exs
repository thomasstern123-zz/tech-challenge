defmodule Efood.Repo.Migrations.AddCart do
  use Ecto.Migration

  def change do
    create table(:cart) do
      add :product_name, :string
      add :product_quantity, :integer

      timestamps
    end
  end
end
