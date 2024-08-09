defmodule Core.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Core.Inventory` context.
  """

  @doc """
  Generate a department.
  """
  def department_fixture(attrs \\ %{}) do
    {:ok, department} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name"
      })
      |> Core.Inventory.create_department()

    department
  end

  @doc """
  Generate a catalogue.
  """
  def catalogue_fixture(attrs \\ %{}) do
    {:ok, catalogue} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Core.Inventory.create_catalogue()

    catalogue
  end

  @doc """
  Generate a product_type.
  """
  def product_type_fixture(attrs \\ %{}) do
    {:ok, product_type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Core.Inventory.create_product_type()

    product_type
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        purchase_price: "120.5",
        quantity: 120.5
      })
      |> Core.Inventory.create_product()

    product
  end
end
