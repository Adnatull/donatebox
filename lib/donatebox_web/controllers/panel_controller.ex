defmodule DonateboxWeb.PanelController do
  use DonateboxWeb, :controller

  alias Donatebox.Accounts
  alias Donatebox.Accounts.User
  alias Donatebox.Donations
  alias Donatebox.Donations.Pendingdonation
  import Plug.Conn

  import Ecto.Query, warn: false
  alias Donatebox.Repo

  def index(conn, _) do
#    render conn, "index.html"

    pendingdonations = Donations.list_pendingdonations()
    render(conn, "index.html", pendingdonations: pendingdonations)


  end



end
