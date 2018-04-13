defmodule Donatebox.Repo.Migrations.AddContactUofUserInDonations do
  use Ecto.Migration

  def change do
    alter table("pendingdonations") do
      add :contactno, :string
    end
  end
end
