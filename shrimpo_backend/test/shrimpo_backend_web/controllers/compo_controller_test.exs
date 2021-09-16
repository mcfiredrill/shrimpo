defmodule ShrimpoBackendWeb.CompoControllerTest do
  use ShrimpoBackendWeb.ConnCase

  alias ShrimpoBackend.Shrimpo
  alias ShrimpoBackend.Shrimpo.Compo

  @create_attrs %{
    end_at: "2010-04-17T14:00:00Z",
    name: "some name",
    start_at: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    end_at: "2011-05-18T15:01:01Z",
    name: "some updated name",
    start_at: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{end_at: nil, name: nil, start_at: nil}

  def fixture(:compo) do
    {:ok, compo} = Shrimpo.create_compo(@create_attrs)
    compo
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all compos", %{conn: conn} do
      conn = get(conn, Routes.compo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create compo" do
    test "renders compo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.compo_path(conn, :create), compo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.compo_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_at" => "2010-04-17T14:00:00Z",
               "name" => "some name",
               "start_at" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.compo_path(conn, :create), compo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update compo" do
    setup [:create_compo]

    test "renders compo when data is valid", %{conn: conn, compo: %Compo{id: id} = compo} do
      conn = put(conn, Routes.compo_path(conn, :update, compo), compo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.compo_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_at" => "2011-05-18T15:01:01Z",
               "name" => "some updated name",
               "start_at" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, compo: compo} do
      conn = put(conn, Routes.compo_path(conn, :update, compo), compo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete compo" do
    setup [:create_compo]

    test "deletes chosen compo", %{conn: conn, compo: compo} do
      conn = delete(conn, Routes.compo_path(conn, :delete, compo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.compo_path(conn, :show, compo))
      end
    end
  end

  defp create_compo(_) do
    compo = fixture(:compo)
    %{compo: compo}
  end
end
