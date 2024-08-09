defmodule Core.Repo.Migrations.CreateCatalogues do
  use Ecto.Migration

  def change do
    create table(:catalogues) do
      add :name, :string
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:catalogues, [:department_id])
  end
end
