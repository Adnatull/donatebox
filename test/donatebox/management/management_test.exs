defmodule Donatebox.ManagementTest do
  use Donatebox.DataCase

  alias Donatebox.Management

  describe "admins" do
    alias Donatebox.Management.Admin

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Management.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Management.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Management.create_admin(@valid_attrs)
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, admin} = Management.update_admin(admin, @update_attrs)
      assert %Admin{} = admin
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_admin(admin, @invalid_attrs)
      assert admin == Management.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Management.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Management.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Management.change_admin(admin)
    end
  end
end
