defmodule Core.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Core.Accounts` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        password_hash: "some password_hash",
        username: "some username"
      })
      |> Core.Accounts.create_admin()

    admin
  end

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        password_hash: "some password_hash",
        username: "some username"
      })
      |> Core.Accounts.create_company()

    company
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        password_hash: "some password_hash",
        username: "some username"
      })
      |> Core.Accounts.create_employee()

    employee
  end
end
