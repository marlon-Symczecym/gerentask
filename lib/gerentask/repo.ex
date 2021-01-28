defmodule Gerentask.Repo do
  use Ecto.Repo,
    otp_app: :gerentask,
    adapter: Ecto.Adapters.Postgres
end
