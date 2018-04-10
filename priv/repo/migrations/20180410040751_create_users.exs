defmodule Donatebox.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
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

      timestamps()
      end

      create unique_index(:users, [:username])
      create unique_index(:users, [:email])
  end
end
