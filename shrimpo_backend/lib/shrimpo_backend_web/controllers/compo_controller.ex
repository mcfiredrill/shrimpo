defmodule ShrimpoBackendWeb.CompoController do
  use ShrimpoBackendWeb, :controller

  alias ShrimpoBackend.Shrimpo
  alias ShrimpoBackend.Shrimpo.Compo

  action_fallback ShrimpoBackendWeb.FallbackController

  def index(conn, _params) do
    compos = Shrimpo.list_compos()
    render(conn, "index.json", compos: compos)
  end

  def create(conn, %{"compo" => compo_params}) do
    with {:ok, %Compo{} = compo} <- Shrimpo.create_compo(compo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.compo_path(conn, :show, compo))
      |> render("show.json", compo: compo)
    end
  end

  def show(conn, %{"id" => id}) do
    compo = Shrimpo.get_compo!(id)
    render(conn, "show.json", compo: compo)
  end

  def update(conn, %{"id" => id, "compo" => compo_params}) do
    compo = Shrimpo.get_compo!(id)

    with {:ok, %Compo{} = compo} <- Shrimpo.update_compo(compo, compo_params) do
      render(conn, "show.json", compo: compo)
    end
  end

  def delete(conn, %{"id" => id}) do
    compo = Shrimpo.get_compo!(id)

    with {:ok, %Compo{}} <- Shrimpo.delete_compo(compo) do
      send_resp(conn, :no_content, "")
    end
  end
end
