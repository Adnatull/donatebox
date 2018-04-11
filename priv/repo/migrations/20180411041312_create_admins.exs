defmodule Donatebox.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :firstname, :string
      add :lastname, :string
      add :gender, :string
      add :birth, :date
      add :mobile, :string
      add :address, :string
      add :postal, :string
      add :country, :string
      add :profilepic, :string
      add :profession, :string
      add :nationalID, :string
      add :bloodgroup, :string
      add :role, :string

      timestamps()
      end

      create unique_index(:admins, [:username])
      create unique_index(:admins, [:email])
  end
end
