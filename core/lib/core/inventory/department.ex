defmodule Core.Inventory.Department do
  use Ecto.Schema
  import Ecto.Changeset

  schema "departments" do
    field :name, :string
    field :address, :string
    field :company_id, :id

    belongs_to :company, Core.Accounts.Company

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:name, :address, :company_id])
    |> validate_required([:name, :address, :company_id])
    |> foreign_key_constraint(:company_id)
  end
end
