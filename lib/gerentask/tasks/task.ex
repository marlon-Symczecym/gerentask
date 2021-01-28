defmodule Gerentask.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :concluded, :boolean, default: false
    field :levels, :string
    field :message, :string

    timestamps()
  end

  @doc false
  @fields_required [:message, :concluded]
  @fields [:message, :concluded, :levels]
  def changeset(task, attrs \\ %{}) do
    task
    |> cast(attrs, @fields)
    |> validate_required(@fields_required, message: "Campos obrigatórios!")
    |> validate_length(:message, min: 5, message: "A tarefa deve ter mais de 5 letras!")
  end
end
