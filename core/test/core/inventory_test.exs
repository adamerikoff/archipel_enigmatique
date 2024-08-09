defmodule Core.InventoryTest do
  use Core.DataCase

  alias Core.Inventory

  describe "departments" do
    alias Core.Inventory.Department

    import Core.InventoryFixtures

    @invalid_attrs %{name: nil, address: nil}

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Inventory.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Inventory.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{name: "some name", address: "some address"}

      assert {:ok, %Department{} = department} = Inventory.create_department(valid_attrs)
      assert department.name == "some name"
      assert department.address == "some address"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address"}

      assert {:ok, %Department{} = department} = Inventory.update_department(department, update_attrs)
      assert department.name == "some updated name"
      assert department.address == "some updated address"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_department(department, @invalid_attrs)
      assert department == Inventory.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Inventory.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Inventory.change_department(department)
    end
  end

  describe "catalogues" do
    alias Core.Inventory.Catalogue

    import Core.InventoryFixtures

    @invalid_attrs %{name: nil}

    test "list_catalogues/0 returns all catalogues" do
      catalogue = catalogue_fixture()
      assert Inventory.list_catalogues() == [catalogue]
    end

    test "get_catalogue!/1 returns the catalogue with given id" do
      catalogue = catalogue_fixture()
      assert Inventory.get_catalogue!(catalogue.id) == catalogue
    end

    test "create_catalogue/1 with valid data creates a catalogue" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Catalogue{} = catalogue} = Inventory.create_catalogue(valid_attrs)
      assert catalogue.name == "some name"
    end

    test "create_catalogue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_catalogue(@invalid_attrs)
    end

    test "update_catalogue/2 with valid data updates the catalogue" do
      catalogue = catalogue_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Catalogue{} = catalogue} = Inventory.update_catalogue(catalogue, update_attrs)
      assert catalogue.name == "some updated name"
    end

    test "update_catalogue/2 with invalid data returns error changeset" do
      catalogue = catalogue_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_catalogue(catalogue, @invalid_attrs)
      assert catalogue == Inventory.get_catalogue!(catalogue.id)
    end

    test "delete_catalogue/1 deletes the catalogue" do
      catalogue = catalogue_fixture()
      assert {:ok, %Catalogue{}} = Inventory.delete_catalogue(catalogue)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_catalogue!(catalogue.id) end
    end

    test "change_catalogue/1 returns a catalogue changeset" do
      catalogue = catalogue_fixture()
      assert %Ecto.Changeset{} = Inventory.change_catalogue(catalogue)
    end
  end

  describe "product_types" do
    alias Core.Inventory.ProductType

    import Core.InventoryFixtures

    @invalid_attrs %{name: nil}

    test "list_product_types/0 returns all product_types" do
      product_type = product_type_fixture()
      assert Inventory.list_product_types() == [product_type]
    end

    test "get_product_type!/1 returns the product_type with given id" do
      product_type = product_type_fixture()
      assert Inventory.get_product_type!(product_type.id) == product_type
    end

    test "create_product_type/1 with valid data creates a product_type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ProductType{} = product_type} = Inventory.create_product_type(valid_attrs)
      assert product_type.name == "some name"
    end

    test "create_product_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product_type(@invalid_attrs)
    end

    test "update_product_type/2 with valid data updates the product_type" do
      product_type = product_type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ProductType{} = product_type} = Inventory.update_product_type(product_type, update_attrs)
      assert product_type.name == "some updated name"
    end

    test "update_product_type/2 with invalid data returns error changeset" do
      product_type = product_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product_type(product_type, @invalid_attrs)
      assert product_type == Inventory.get_product_type!(product_type.id)
    end

    test "delete_product_type/1 deletes the product_type" do
      product_type = product_type_fixture()
      assert {:ok, %ProductType{}} = Inventory.delete_product_type(product_type)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product_type!(product_type.id) end
    end

    test "change_product_type/1 returns a product_type changeset" do
      product_type = product_type_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product_type(product_type)
    end
  end

  describe "products" do
    alias Core.Inventory.Product

    import Core.InventoryFixtures

    @invalid_attrs %{name: nil, quantity: nil, purchase_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", quantity: 120.5, purchase_price: "120.5"}

      assert {:ok, %Product{} = product} = Inventory.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.quantity == 120.5
      assert product.purchase_price == Decimal.new("120.5")
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", quantity: 456.7, purchase_price: "456.7"}

      assert {:ok, %Product{} = product} = Inventory.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.quantity == 456.7
      assert product.purchase_price == Decimal.new("456.7")
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end
end
