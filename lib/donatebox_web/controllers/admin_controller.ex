defmodule DonateboxWeb.AdminController do
  use DonateboxWeb, :controller

  alias Donatebox.Accounts
  alias Donatebox.Accounts.User
  alias Donatebox.Donations
  alias Donatebox.Donations.Pendingdonation
  import Plug.Conn

  plug :put_layout, "admin.html"

  def index(conn, _) do
    render conn, "index.html"
  end

end
