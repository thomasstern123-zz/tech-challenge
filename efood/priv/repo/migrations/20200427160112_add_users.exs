defmodule Efood.Repo.Migrations.AddUsers do
  @moduledoc """
  This migration created the users table with the following fields:\n
    -email\n
    -provider\n
    -token
  """

  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :provider, :string
      add :token, :string

      timestamps()
    end
  end
end
