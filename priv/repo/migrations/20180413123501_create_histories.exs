defmodule Donatebox.Repo.Migrations.CreateHistories do
  use Ecto.Migration

  def change do
    create table(:histories) do
      add :donorname, :string
      add :title, :string
      add :type, :string
      add :quantity, :float
      add :req_date, :date
      add :accept_date, :date
      add :meetlocation, :string
      add :adminname, :string
      add :admincontact, :string
      add :donationstatus, :string

      timestamps()
    end


  end
end
