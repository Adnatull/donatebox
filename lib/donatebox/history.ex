defmodule Donatebox.History do
  use Ecto.Schema
  import Ecto.Changeset


  schema "histories" do
    field :accept_date, :date
    field :admincontact, :string
    field :adminname, :string
    field :donationstatus, :string
    field :donorname, :string
    field :meetlocation, :string
    field :quantity, :float
    field :req_date, :date
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(history, attrs) do
    history
    |> cast(attrs, [:donorname, :title, :type, :quantity, :req_date, :accept_date, :meetlocation, :adminname, :admincontact, :donationstatus])
    |> validate_required([:donorname, :title, :type, :quantity, :req_date, :accept_date, :meetlocation, :adminname, :admincontact, :donationstatus])
  end



end
