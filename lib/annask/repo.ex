defmodule Annask.Repo do
  use Ecto.Repo,
    otp_app: :annask,
    adapter: Ecto.Adapters.Postgres
end
