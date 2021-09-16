defmodule ShrimpoBackend.Repo do
  use Ecto.Repo,
    otp_app: :shrimpo_backend,
    adapter: Ecto.Adapters.Postgres
end
