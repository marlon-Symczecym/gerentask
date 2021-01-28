defmodule Gerentask.Tasks do
  alias Gerentask.{Repo, Task}

  def list_all() do
    Task
    |> Repo.all()
    |> Enum.sort_by(&(&1.levels == "warning"), :asc)
  end

  def get_task!(id), do: Repo.get!(Task, id)

  def count_tasks(), do: list_all() |> Enum.count()

  def count_concluded() do
    list_all()
    |> Enum.filter(&(&1.concluded == true))
    |> Enum.count()
  end

  def count_not_concluded() do
    list_all()
    |> Enum.filter(&(&1.concluded == false))
    |> Enum.count()
  end

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def update_task(task, task_params) do
    task
    |> Task.changeset(task_params)
    |> Repo.update()
  end

  def delete_task(id) do
    get_task!(id)
    |> Repo.delete()
  end

  def conclude(id) do
    task = get_task!(id)

    task
    |> Task.changeset(%{concluded: !task.concluded})
    |> Repo.update()
  end
end
