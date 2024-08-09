defmodule Core.Repo.Migrations.RenameTypeToProductType do
  use Ecto.Migration

  def change do
    rename table(:products), :type, to: :product_type
  end
end
