defmodule Server.MovieView do
  use Server.Web, :view

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, Server.MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, Server.MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{id: movie.id, title: movie.title, year: movie.year, poster: movie.poster}
  end
end
