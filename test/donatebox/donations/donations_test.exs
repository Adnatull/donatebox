defmodule Donatebox.DonationsTest do
  use Donatebox.DataCase

  alias Donatebox.Donations

  describe "pendingdonations" do
    alias Donatebox.Donations.Pendingdonation

    @valid_attrs %{acceptingdate: ~D[2010-04-17], location: "some location", quantity: 120.5, type: "some type", username: "some username"}
    @update_attrs %{acceptingdate: ~D[2011-05-18], location: "some updated location", quantity: 456.7, type: "some updated type", username: "some updated username"}
    @invalid_attrs %{acceptingdate: nil, location: nil, quantity: nil, type: nil, username: nil}

    def pendingdonation_fixture(attrs \\ %{}) do
      {:ok, pendingdonation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Donations.create_pendingdonation()

      pendingdonation
    end

    test "list_pendingdonations/0 returns all pendingdonations" do
      pendingdonation = pendingdonation_fixture()
      assert Donations.list_pendingdonations() == [pendingdonation]
    end

    test "get_pendingdonation!/1 returns the pendingdonation with given id" do
      pendingdonation = pendingdonation_fixture()
      assert Donations.get_pendingdonation!(pendingdonation.id) == pendingdonation
    end

    test "create_pendingdonation/1 with valid data creates a pendingdonation" do
      assert {:ok, %Pendingdonation{} = pendingdonation} = Donations.create_pendingdonation(@valid_attrs)
      assert pendingdonation.acceptingdate == ~D[2010-04-17]
      assert pendingdonation.location == "some location"
      assert pendingdonation.quantity == 120.5
      assert pendingdonation.type == "some type"
      assert pendingdonation.username == "some username"
    end

    test "create_pendingdonation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Donations.create_pendingdonation(@invalid_attrs)
    end

    test "update_pendingdonation/2 with valid data updates the pendingdonation" do
      pendingdonation = pendingdonation_fixture()
      assert {:ok, pendingdonation} = Donations.update_pendingdonation(pendingdonation, @update_attrs)
      assert %Pendingdonation{} = pendingdonation
      assert pendingdonation.acceptingdate == ~D[2011-05-18]
      assert pendingdonation.location == "some updated location"
      assert pendingdonation.quantity == 456.7
      assert pendingdonation.type == "some updated type"
      assert pendingdonation.username == "some updated username"
    end

    test "update_pendingdonation/2 with invalid data returns error changeset" do
      pendingdonation = pendingdonation_fixture()
      assert {:error, %Ecto.Changeset{}} = Donations.update_pendingdonation(pendingdonation, @invalid_attrs)
      assert pendingdonation == Donations.get_pendingdonation!(pendingdonation.id)
    end

    test "delete_pendingdonation/1 deletes the pendingdonation" do
      pendingdonation = pendingdonation_fixture()
      assert {:ok, %Pendingdonation{}} = Donations.delete_pendingdonation(pendingdonation)
      assert_raise Ecto.NoResultsError, fn -> Donations.get_pendingdonation!(pendingdonation.id) end
    end

    test "change_pendingdonation/1 returns a pendingdonation changeset" do
      pendingdonation = pendingdonation_fixture()
      assert %Ecto.Changeset{} = Donations.change_pendingdonation(pendingdonation)
    end
  end
end
