defmodule PhoenixCrudWeb.FoodController do
  use PhoenixCrudWeb, :controller
  alias PhoenixCrud.Food, as: Food
  alias PhoenixCrud.Repo, as: Repo
  alias Plug.Conn, as: Conn

  def index(conn, _params) do
    foods = Repo.all(Food)
    json(conn, foods)
  end

  def create(conn, %{
        "name" => name,
        "country" => country
  }) do
    changeset = Food.changeset(%Food{}, %{"name" => name, "country" => country})
    with {:ok, food} <- Repo.insert(changeset) do
      conn
      |> put_status(:created)
      |> json(food)
    end
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(Food, id) do
      nil -> Conn.resp(conn, 404, "")
      food -> json(conn, food)
    end
  end

  def delete(conn, %{"id" => id}) do
    case Repo.get(Food, id) do
      nil -> Conn.resp(conn, 404, "")
      food -> Repo.delete(food)
        resp(conn, 204, "")
    end
  end

end
