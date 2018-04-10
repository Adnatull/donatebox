defmodule DonateboxWeb.AuthenticationController do
  use DonateboxWeb, :controller

  alias Donatebox.Accounts
  alias Donatebox.Accounts.User
  import Plug.Conn

  plug :put_layout, "auth.html"
  def index(conn, _params) do
#    render conn, "index.html"
    changeset = Accounts.change_user(%User{})
    render(conn, "index.html", changeset: changeset)
  end

  def log(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    case Accounts.login(user_params) do

      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> redirect(to: "/login")
    end

  end

  def register(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "register.html", changeset: changeset)
  end

  def createuser(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
  #  changeset = Accounts.change_user(%User{})
  #  render(conn, "index.html", changeset: changeset)

    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "register.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
      conn
        |> delete_session(:current_user)
        |> put_flash(:info, "Logged out")
        |> redirect(to: "/")
  end


end
