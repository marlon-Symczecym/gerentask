alias Gerentask.{Repo, Task}

task1 = Task.changeset(%Task{}, %{message: "Fazer Cafe", levels: "warning"})
Repo.insert!(task1)

task2 = Task.changeset(%Task{}, %{message: "Estufar Elixir", levels: "urgent"})
Repo.insert!(task2)
