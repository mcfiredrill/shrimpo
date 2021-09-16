defmodule ShrimpoBackendWeb.CompoView do
  use ShrimpoBackendWeb, :view
  alias ShrimpoBackendWeb.CompoView

  def render("index.json", %{compos: compos}) do
    %{data: render_many(compos, CompoView, "compo.json")}
  end

  def render("show.json", %{compo: compo}) do
    %{data: render_one(compo, CompoView, "compo.json")}
  end

  def render("compo.json", %{compo: compo}) do
    %{id: compo.id,
      name: compo.name,
      start_at: compo.start_at,
      end_at: compo.end_at}
  end
end
