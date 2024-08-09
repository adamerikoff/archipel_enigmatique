defmodule Core.Inventory.ProductType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_types" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product_type, attrs) do
    product_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
