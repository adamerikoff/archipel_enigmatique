defmodule Core.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string
      add :address, :string
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:departments, [:company_id])
  end
end
