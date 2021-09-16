defmodule ShrimpoBackend.Compo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "compos" do
    field :end_at, :utc_datetime
    field :name, :string
    field :start_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(compo, attrs) do
    compo
    |> cast(attrs, [:name, :start_at, :end_at])
    |> validate_required([:name, :start_at, :end_at])
  end
end
