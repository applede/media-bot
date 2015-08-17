defmodule Server.MovieController do
  use Server.Web, :controller

  alias Server.Movie

  plug :scrub_params, "movie" when action in [:create, :update]

  def index(conn, _params) do
    movies = Repo.all(Movie)
    render(conn, "index.json", movies: movies)
  end

  def create(conn, %{"movie" => movie_params}) do
    changeset = Movie.changeset(%Movie{}, movie_params)

    case Repo.insert(changeset) do
      {:ok, movie} ->
        conn
        |> put_status(:created)
        |> render("show.json", movie: movie)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    movie = Repo.get!(Movie, id)
    render conn, "show.json", movie: movie
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = Repo.get!(Movie, id)
    changeset = Movie.changeset(movie, movie_params)

    case Repo.update(changeset) do
      {:ok, movie} ->
        render(conn, "show.json", movie: movie)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Repo.get!(Movie, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    _movie = Repo.delete!(movie)

    send_resp(conn, :no_content, "")
  end

  def scan(conn, _params) do
    case File.ls("/Volumes/Raid5/public/themoviedb2") do
      {:ok, folders} ->
        Enum.each(folders, fn(folder) ->
          case Regex.run(~r/^(.+) +\((\d+)\)$/, folder) do
            nil ->
              IO.puts "no match"
            [_, title, year_str] ->
              case Integer.parse(year_str) do
                {year, ""} ->
                  IO.puts "#{title} #{year}"
                  changeset = Movie.changeset(%Movie{}, %{title: title, year: year, poster: ""})
                  case Repo.insert(changeset) do
                    {:ok, _m} ->
                      ;
                    {:error, c} ->
                      IO.inspect c.errors
                  end

                _ ->
                  IO.puts "illegal year"
              end
          end
        end)
      {:error, _reason} ->
    end
    send_resp(conn, :no_content, "")
  end
end
