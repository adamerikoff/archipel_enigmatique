defmodule Core.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :quantity, :float
    field :purchase_price, :decimal
    field :type, :id
    field :catalogue_id, :id

    belongs_to :catalogue, Core.Accounts.Catalogue
    belongs_to :product_types, Core.Accounts.ProductType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :quantity, :purchase_price, :catalogue_id])
    |> validate_required([:name, :quantity, :purchase_price, :catalogue_id])
    |> foreign_key_constraint(:catalogue_id)
  end
end
