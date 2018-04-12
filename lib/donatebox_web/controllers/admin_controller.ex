defmodule DonateboxWeb.AdminController do
  use DonateboxWeb, :controller


  alias Donatebox.Management
  alias Donatebox.Management.Admin
  import Plug.Conn

  plug :put_layout, "admin.html"

  def index(conn, _) do

    changeset = Management.change_admin(%Admin{})
    render(conn, "index.html", changeset: changeset)

  end

  def log(conn, %{"admin" => user_params}) do
        case Management.login(user_params) do

      {:ok, admin} ->
        IO.puts "hello"
        IO.inspect(admin)
        conn
        |> put_session(:current_admin, admin.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> redirect(to: "/admin")
    end
  end

  def logout(conn, _) do
      conn
        |> delete_session(:current_admin)
        |> put_flash(:info, "Logged out")
        |> redirect(to: "/")
  end

end
