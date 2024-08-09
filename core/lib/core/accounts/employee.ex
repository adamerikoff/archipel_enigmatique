defmodule Core.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :username, :string
    field :password_hash, :string
    field :company_id, :id

    belongs_to :company, Core.Accounts.Company

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:username, :password_hash, :company_id])
    |> validate_required([:username, :password_hash, :company_id])
    |> foreign_key_constraint(:company_id)
  end
end
