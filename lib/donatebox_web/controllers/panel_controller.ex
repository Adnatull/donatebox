defmodule DonateboxWeb.PanelController do
  use DonateboxWeb, :controller

  alias Donatebox.Accounts
  alias Donatebox.Accounts.User
  alias Donatebox.Donations
  alias Donatebox.Donations.Pendingdonation
  alias Donatebox.Management
  alias Donatebox.Management.Admin
  alias Donatebox.History
  import Plug.Conn

  import Ecto.Query, warn: false
  alias Donatebox.Repo

  def index(conn, _) do
#    render conn, "index.html"

    pendingdonations = Donations.list_pendingdonations()
    render(conn, "index.html", pendingdonations: pendingdonations)
  end





  def show(conn, %{"id" => id}) do
    donation = Repo.get!(Pendingdonation, id)
    id = Plug.Conn.get_session(conn, :current_admin)
    admin = Repo.get!(Admin, id)

    case Donations.create_history(admin, donation) do
      {:ok, _history} ->


        {:ok, _admin} = Donations.delete_pendingdonation(donation)

        IO.puts("done")
        conn
        |> put_flash(:info, "Donation request has been accepted and moved to archive successfully.")
        |> redirect(to: "/panel")
    #    pendingdonations = Donations.list_pendingdonations()
    #    render(conn, "index.html", pendingdonations: pendingdonations)

      {:error, _} ->
        conn
        |> put_flash(:info, "Something went wrong! Try again!")
        |> redirect(to: "/panel")

    end
  end


  



end
