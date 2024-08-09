defmodule Core.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :quantity, :float
      add :purchase_price, :decimal
      add :type, references(:product_types, on_delete: :nothing)
      add :catalogue_id, references(:catalogues, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:products, [:type])
    create index(:products, [:catalogue_id])
  end
end
