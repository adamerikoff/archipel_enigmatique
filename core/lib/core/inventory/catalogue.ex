defmodule Core.Inventory.Catalogue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "catalogues" do
    field :name, :string

    belongs_to :department, Core.Inventory.Department
    has_many :products, Core.Inventory.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(catalogue, attrs) do
    catalogue
    |> cast(attrs, [:name])
    |> validate_required([:name, :department_id])
    |> foreign_key_constraint(:department_id)
  end
end
