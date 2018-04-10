defmodule DonateboxWeb.PageController do
  use DonateboxWeb, :controller

  alias Donatebox.Accounts
  alias Donatebox.Accounts.User
  alias Donatebox.Donations
  alias Donatebox.Donations.Pendingdonation
  import Plug.Conn

  def index(conn, _params) do
    render conn, "index.html"
  end

  def profile(conn, _) do
    render conn, "profile.html"
  end

  def editprofile(conn, _) do
    changeset = Accounts.change_user(%User{})
    render(conn, "edit.html", changeset: changeset)
  end

  def profileupdate(conn,  %{"user" => user_params}) do
    IO.inspect(user_params)
    id = user_params["id"]
    IO.puts(id)

    user = Accounts.get_user!(id)
    case Accounts.update_user(user, user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "user updated successfully.")
        |> redirect(to: "/profile")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def donate(conn, _) do
    changeset = Donations.change_pendingdonation(%Pendingdonation{})
    render(conn, "donate.html", changeset: changeset)
  end

  def givedonation(conn, %{"pendingdonation" => params}) do
    IO.inspect(params)
    case Donations.create_pendingdonation(params) do
      {:ok, pendingdonation} ->
        conn
        |> put_flash(:info, "Donation request has been submitted!")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "donate.html", changeset: changeset)
    end
  end

end
