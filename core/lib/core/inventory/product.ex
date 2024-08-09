defmodule Core.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :quantity, :float
    field :purchase_price, :decimal

    belongs_to :catalogue, Core.Inventory.Catalogue
    belongs_to :product_type, Core.Inventory.ProductType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :quantity, :purchase_price, :catalogue_id, :product_type])  # Updated field name
    |> validate_required([:name, :quantity, :purchase_price, :catalogue_id, :product_type])  # Updated field name
    |> foreign_key_constraint(:catalogue_id)
    |> foreign_key_constraint(:product_type)  # Updated FK constraint
  end
end
