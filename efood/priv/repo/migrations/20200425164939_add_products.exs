defmodule Efood.Repo.Migrations.AddProducts do
  @moduledoc """
  This migration created the products table with the following fields:\n
    -product_name\n
    -categories\n
    -url
  """

  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :text
      add :categories, :text
      add :url, :text
    end
  end
end
