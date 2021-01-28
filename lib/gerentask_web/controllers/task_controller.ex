defmodule GerentaskWeb.TaskController do
  use GerentaskWeb, :controller

  alias Gerentask.{Tasks, Task}

  def index(conn, _params) do
    tasks = Tasks.list_all()
    count_tasks = Tasks.count_tasks()
    count_concluded = Tasks.count_concluded()
    count_not_concluded = Tasks.count_not_concluded()

    render(conn, "index.html",
      count_tasks: count_tasks,
      count_concluded: count_concluded,
      count_not_concluded: count_not_concluded,
      tasks: tasks
    )
  end

  def new(conn, _params) do
    changeset = Task.changeset(%Task{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task}) do
    case(Tasks.create_task(task)) do
      {:ok, _task} ->
        conn
        |> put_flash(:info, "Tarefa criada com sucesso!")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Task.changeset(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, _task} ->
        conn
        |> put_flash(:info, "Tarefa alterada com sucesso!")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Tasks.delete_task(id)

    conn
    |> put_flash(:info, "Tarefa deletada com sucesso!")
    |> redirect(to: Routes.task_path(conn, :index))
  end

  def conclude(conn, %{"id" => id}) do
    case Tasks.conclude(id) do
      {:ok, _task} ->
        conn
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, _changeset} ->
        render(conn, :index)
    end
  end
end
