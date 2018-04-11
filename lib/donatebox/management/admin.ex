defmodule Donatebox.Management.Admin do
  use Ecto.Schema
  import Ecto.Changeset


  schema "admins" do
    field :address, :string
    field :birth, :date
    field :country, :string
    field :email, :string
    field :firstname, :string
    field :gender, :string
    field :lastname, :string
    field :mobile, :string
    field :nationalID, :string
    field :password, :string
    field :postal, :string
    field :profession, :string
    field :profilepic, :string
    field :username, :string
    field :bloodgroup, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [])
    |> validate_required([])
  end
end
