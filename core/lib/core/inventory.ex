defmodule Core.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Core.Repo

  alias Core.Inventory.Department
  alias Core.Inventory.Catalogue
  alias Core.Inventory.ProductType
  alias Core.Inventory.Product

  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  # DEPARTMENTS
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################


  @doc """
  Returns the list of departments.

  ## Examples

      iex> list_departments()
      [%Department{}, ...]

  """
  def list_departments do
    Repo.all(Department)
  end

  @doc """
  Gets a single department.

  Raises `Ecto.NoResultsError` if the Department does not exist.

  ## Examples

      iex> get_department!(123)
      %Department{}

      iex> get_department!(456)
      ** (Ecto.NoResultsError)

  """
  def get_department!(id), do: Repo.get!(Department, id)

  @doc """
  Creates a department.

  ## Examples

      iex> create_department(%{field: value})
      {:ok, %Department{}}

      iex> create_department(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_department(attrs \\ %{}) do
    %Department{}
    |> Department.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a department.

  ## Examples

      iex> update_department(department, %{field: new_value})
      {:ok, %Department{}}

      iex> update_department(department, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_department(%Department{} = department, attrs) do
    department
    |> Department.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a department.

  ## Examples

      iex> delete_department(department)
      {:ok, %Department{}}

      iex> delete_department(department)
      {:error, %Ecto.Changeset{}}

  """
  def delete_department(%Department{} = department) do
    Repo.delete(department)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking department changes.

  ## Examples

      iex> change_department(department)
      %Ecto.Changeset{data: %Department{}}

  """
  def change_department(%Department{} = department, attrs \\ %{}) do
    Department.changeset(department, attrs)
  end

  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  # CATALOGUES
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################

  @doc """
  Returns the list of catalogues.

  ## Examples

      iex> list_catalogues()
      [%Catalogue{}, ...]

  """
  def list_catalogues do
    Repo.all(Catalogue)
  end

  @doc """
  Gets a single catalogue.

  Raises `Ecto.NoResultsError` if the Catalogue does not exist.

  ## Examples

      iex> get_catalogue!(123)
      %Catalogue{}

      iex> get_catalogue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_catalogue!(id), do: Repo.get!(Catalogue, id)

  @doc """
  Creates a catalogue.

  ## Examples

      iex> create_catalogue(%{field: value})
      {:ok, %Catalogue{}}

      iex> create_catalogue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_catalogue(attrs \\ %{}) do
    %Catalogue{}
    |> Catalogue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a catalogue.

  ## Examples

      iex> update_catalogue(catalogue, %{field: new_value})
      {:ok, %Catalogue{}}

      iex> update_catalogue(catalogue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_catalogue(%Catalogue{} = catalogue, attrs) do
    catalogue
    |> Catalogue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a catalogue.

  ## Examples

      iex> delete_catalogue(catalogue)
      {:ok, %Catalogue{}}

      iex> delete_catalogue(catalogue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_catalogue(%Catalogue{} = catalogue) do
    Repo.delete(catalogue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking catalogue changes.

  ## Examples

      iex> change_catalogue(catalogue)
      %Ecto.Changeset{data: %Catalogue{}}

  """
  def change_catalogue(%Catalogue{} = catalogue, attrs \\ %{}) do
    Catalogue.changeset(catalogue, attrs)
  end

  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  # PRODUCT_TYPES
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  @doc """
  Returns the list of product_types.

  ## Examples

      iex> list_product_types()
      [%ProductType{}, ...]

  """
  def list_product_types do
    Repo.all(ProductType)
  end

  @doc """
  Gets a single product_type.

  Raises `Ecto.NoResultsError` if the Product type does not exist.

  ## Examples

      iex> get_product_type!(123)
      %ProductType{}

      iex> get_product_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_type!(id), do: Repo.get!(ProductType, id)

  @doc """
  Creates a product_type.

  ## Examples

      iex> create_product_type(%{field: value})
      {:ok, %ProductType{}}

      iex> create_product_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_type(attrs \\ %{}) do
    %ProductType{}
    |> ProductType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_type.

  ## Examples

      iex> update_product_type(product_type, %{field: new_value})
      {:ok, %ProductType{}}

      iex> update_product_type(product_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_type(%ProductType{} = product_type, attrs) do
    product_type
    |> ProductType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_type.

  ## Examples

      iex> delete_product_type(product_type)
      {:ok, %ProductType{}}

      iex> delete_product_type(product_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_type(%ProductType{} = product_type) do
    Repo.delete(product_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_type changes.

  ## Examples

      iex> change_product_type(product_type)
      %Ecto.Changeset{data: %ProductType{}}

  """
  def change_product_type(%ProductType{} = product_type, attrs \\ %{}) do
    ProductType.changeset(product_type, attrs)
  end

  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  # PRODUCTS
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################
  ###########################################################################

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
