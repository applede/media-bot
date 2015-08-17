defmodule Server.V1.MovieControllerTest do
  use Server.ConnCase

  alias Server.Movie
  @valid_attrs %{poster: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, movie_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    movie = Repo.insert! %Movie{}
    conn = get conn, movie_path(conn, :show, movie)
    assert json_response(conn, 200)["data"] == %{
      "id" => movie.id
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, movie_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, movie_path(conn, :create), movie: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Movie, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, movie_path(conn, :create), movie: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    movie = Repo.insert! %Movie{}
    conn = put conn, movie_path(conn, :update, movie), movie: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Movie, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    movie = Repo.insert! %Movie{}
    conn = put conn, movie_path(conn, :update, movie), movie: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    movie = Repo.insert! %Movie{}
    conn = delete conn, movie_path(conn, :delete, movie)
    assert response(conn, 204)
    refute Repo.get(Movie, movie.id)
  end
end
