defmodule Efood.Repo.Migrations.AddProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :text
      add :categories, :text
      add :url, :text
    end
  end
end
