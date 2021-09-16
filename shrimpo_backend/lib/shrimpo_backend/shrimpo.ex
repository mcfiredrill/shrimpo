defmodule ShrimpoBackend.Shrimpo do
  @moduledoc """
  The Shrimpo context.
  """

  import Ecto.Query, warn: false
  alias ShrimpoBackend.Repo

  alias ShrimpoBackend.Shrimpo.Compo

  @doc """
  Returns the list of compos.

  ## Examples

      iex> list_compos()
      [%Compo{}, ...]

  """
  def list_compos do
    Repo.all(Compo)
  end

  @doc """
  Gets a single compo.

  Raises `Ecto.NoResultsError` if the Compo does not exist.

  ## Examples

      iex> get_compo!(123)
      %Compo{}

      iex> get_compo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_compo!(id), do: Repo.get!(Compo, id)

  @doc """
  Creates a compo.

  ## Examples

      iex> create_compo(%{field: value})
      {:ok, %Compo{}}

      iex> create_compo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_compo(attrs \\ %{}) do
    %Compo{}
    |> Compo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a compo.

  ## Examples

      iex> update_compo(compo, %{field: new_value})
      {:ok, %Compo{}}

      iex> update_compo(compo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_compo(%Compo{} = compo, attrs) do
    compo
    |> Compo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a compo.

  ## Examples

      iex> delete_compo(compo)
      {:ok, %Compo{}}

      iex> delete_compo(compo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_compo(%Compo{} = compo) do
    Repo.delete(compo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking compo changes.

  ## Examples

      iex> change_compo(compo)
      %Ecto.Changeset{data: %Compo{}}

  """
  def change_compo(%Compo{} = compo, attrs \\ %{}) do
    Compo.changeset(compo, attrs)
  end
end
