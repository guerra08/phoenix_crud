defmodule PhoenixCrud.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :name, :string
      add :country, :string

      timestamps()
    end
  end
end
