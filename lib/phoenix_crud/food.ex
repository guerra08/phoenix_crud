defmodule PhoenixCrud.Food do
  @derive {Jason.Encoder, only: [:id, :name, :country]}

  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :country, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :country])
    |> validate_required([:name, :country])
  end
end
