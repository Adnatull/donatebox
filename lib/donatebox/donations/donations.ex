defmodule Donatebox.Donations do
  @moduledoc """
  The Donations context.
  """

  import Ecto.Query, warn: false
  alias Donatebox.Repo
  alias Donatebox.History
  alias Donatebox.Management
  alias Donatebox.Management.Admin
  import Plug.Conn




  alias Donatebox.Donations.Pendingdonation

  @doc """
  Returns the list of pendingdonations.

  ## Examples

      iex> list_pendingdonations()
      [%Pendingdonation{}, ...]

  """
  def list_pendingdonations do
    Repo.all(Pendingdonation)
  end

  @doc """
  Gets a single pendingdonation.

  Raises `Ecto.NoResultsError` if the Pendingdonation does not exist.

  ## Examples

      iex> get_pendingdonation!(123)
      %Pendingdonation{}

      iex> get_pendingdonation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pendingdonation!(id), do: Repo.get!(Pendingdonation, id)

  @doc """
  Creates a pendingdonation.

  ## Examples

      iex> create_pendingdonation(%{field: value})
      {:ok, %Pendingdonation{}}

      iex> create_pendingdonation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pendingdonation(conn, attrs \\ %{}) do
    IO.inspect(attrs)
    %Pendingdonation{}
    |> Pendingdonation.changeset(attrs)
    |> Repo.insert()
  end

  def create_history(admin, c) do
    IO.inspect(c)
    IO.puts c.username
    donation = %{ donorname: c.username, title: c.title, type: c.type, quantity: c.quantity, req_date: c.inserted_at, accept_date: datetime = DateTime.utc_now(), meetlocation: c.location, adminname: admin.username, admincontact: "123", donationstatus: "Accepted" }

    IO.inspect(donation)

    %History{}
    |> History.changeset(donation)
    |> Repo.insert()
  end

  @doc """
  Updates a pendingdonation.

  ## Examples

      iex> update_pendingdonation(pendingdonation, %{field: new_value})
      {:ok, %Pendingdonation{}}

      iex> update_pendingdonation(pendingdonation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pendingdonation(%Pendingdonation{} = pendingdonation, attrs) do
    pendingdonation
    |> Pendingdonation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pendingdonation.

  ## Examples

      iex> delete_pendingdonation(pendingdonation)
      {:ok, %Pendingdonation{}}

      iex> delete_pendingdonation(pendingdonation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pendingdonation(%Pendingdonation{} = pendingdonation) do
    Repo.delete(pendingdonation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pendingdonation changes.

  ## Examples

      iex> change_pendingdonation(pendingdonation)
      %Ecto.Changeset{source: %Pendingdonation{}}

  """
  def change_pendingdonation(%Pendingdonation{} = pendingdonation) do
    Pendingdonation.changeset(pendingdonation, %{})
  end
end
