defmodule Donatebox.Donations.Pendingdonation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pendingdonations" do
    field :location, :string
    field :quantity, :float
    field :title, :string
    field :type, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(pendingdonation, attrs) do
    pendingdonation
    |> cast(attrs, [:username, :type, :quantity, :title, :location])
    |> validate_required([:username, :type, :quantity, :title, :location])
  end
end
