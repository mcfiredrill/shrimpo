defmodule ShrimpoBackend.Repo.Migrations.CreateCompos do
  use Ecto.Migration

  def change do
    create table(:compos) do
      add :name, :string
      add :start_at, :utc_datetime
      add :end_at, :utc_datetime

      timestamps()
    end

  end
end
