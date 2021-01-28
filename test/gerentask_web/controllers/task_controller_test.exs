defmodule GerentaskWeb.TaskControllerTest do
  use GerentaskWeb.ConnCase

  alias Gerentask.{Repo, Task, Tasks}

  @valid_task %{message: "Valid test", levels: "warning"}
  @invalid_task %{message: nil, levels: nil}
  @updated_task %{message: "updated", levels: "updated"}

  def task_fixture do
    {:ok, task} = Tasks.create_task(@valid_task)
    task
  end

  # test "GET /", %{conn: conn} do
  #   conn = get(conn, "/")
  #   assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  # end

  test "list all tasks", %{conn: conn} do
    task_fixture()

    conn = get(conn, Routes.task_path(conn, :index))
    assert html_response(conn, 200) =~ "Valid test"
  end

  test "new task", %{conn: conn} do
    conn = get(conn, Routes.task_path(conn, :new))

    assert html_response(conn, 200) =~ "Criar Tarefa"
  end

  test "create a new task", %{conn: conn} do
    task = Task.changeset(%Task{}, %{})
    conn = post(conn, Routes.task_path(conn, :create, task), task: @valid_task)

    assert redirected_to(conn) == Routes.task_path(conn, :index)
  end
end
