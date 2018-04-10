defmodule Donatebox.Repo.Migrations.CreatePendingdonations do
  use Ecto.Migration

  def change do
    create table(:pendingdonations) do
      add :username, :string
      add :type, :string
      add :quantity, :float
      add :location, :string
      add :title, :string

      timestamps()
    end

  end
end
