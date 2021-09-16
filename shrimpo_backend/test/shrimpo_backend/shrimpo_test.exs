defmodule ShrimpoBackend.ShrimpoTest do
  use ShrimpoBackend.DataCase

  alias ShrimpoBackend.Shrimpo

  describe "compos" do
    alias ShrimpoBackend.Shrimpo.Compo

    @valid_attrs %{end_at: "2010-04-17T14:00:00Z", name: "some name", start_at: "2010-04-17T14:00:00Z"}
    @update_attrs %{end_at: "2011-05-18T15:01:01Z", name: "some updated name", start_at: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{end_at: nil, name: nil, start_at: nil}

    def compo_fixture(attrs \\ %{}) do
      {:ok, compo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shrimpo.create_compo()

      compo
    end

    test "list_compos/0 returns all compos" do
      compo = compo_fixture()
      assert Shrimpo.list_compos() == [compo]
    end

    test "get_compo!/1 returns the compo with given id" do
      compo = compo_fixture()
      assert Shrimpo.get_compo!(compo.id) == compo
    end

    test "create_compo/1 with valid data creates a compo" do
      assert {:ok, %Compo{} = compo} = Shrimpo.create_compo(@valid_attrs)
      assert compo.end_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert compo.name == "some name"
      assert compo.start_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_compo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shrimpo.create_compo(@invalid_attrs)
    end

    test "update_compo/2 with valid data updates the compo" do
      compo = compo_fixture()
      assert {:ok, %Compo{} = compo} = Shrimpo.update_compo(compo, @update_attrs)
      assert compo.end_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert compo.name == "some updated name"
      assert compo.start_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_compo/2 with invalid data returns error changeset" do
      compo = compo_fixture()
      assert {:error, %Ecto.Changeset{}} = Shrimpo.update_compo(compo, @invalid_attrs)
      assert compo == Shrimpo.get_compo!(compo.id)
    end

    test "delete_compo/1 deletes the compo" do
      compo = compo_fixture()
      assert {:ok, %Compo{}} = Shrimpo.delete_compo(compo)
      assert_raise Ecto.NoResultsError, fn -> Shrimpo.get_compo!(compo.id) end
    end

    test "change_compo/1 returns a compo changeset" do
      compo = compo_fixture()
      assert %Ecto.Changeset{} = Shrimpo.change_compo(compo)
    end
  end
end
