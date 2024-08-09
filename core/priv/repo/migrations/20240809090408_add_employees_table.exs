defmodule Core.Repo.Migrations.AddEmployeesTable do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :username, :string, null: false
      add :password_hash, :string, null: false
      add :company_id, references(:companies, on_delete: :delete_all), null: false

      timestamps()
    end
    create unique_index(:employees, [:username])
    create index(:employees, [:company_id])
  end
end
