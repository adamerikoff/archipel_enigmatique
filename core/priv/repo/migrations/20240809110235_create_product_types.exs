defmodule Core.Repo.Migrations.CreateProductTypes do
  use Ecto.Migration

  def change do
    create table(:product_types) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
