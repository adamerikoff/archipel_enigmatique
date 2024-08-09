defmodule Core.Repo.Migrations.AddCompaniesTable do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :username, :string, null: false
      add :password_hash, :string, null: false

      timestamps()
    end
    create unique_index(:companies, [:username])
  end
end
