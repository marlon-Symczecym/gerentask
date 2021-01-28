defmodule Gerentask.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :message, :string
      add :concluded, :boolean, default: false
      add :levels, :string, default: "Atenção"

      timestamps()
    end
  end
end
