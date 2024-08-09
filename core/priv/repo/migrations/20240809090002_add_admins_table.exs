defmodule Core.Repo.Migrations.AddAdminsTable do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string, null: false
      add :password_hash, :string, null: false

      timestamps()
    end

    create unique_index(:admins, [:username])
  end
end
