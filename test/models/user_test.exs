defmodule MediaBot.UserTest do
  use MediaBot.ModelCase

  alias MediaBot.User

  @valid_attrs %{authentication_tokens: [], confirmed_at: "2010-04-17 14:00:00", hashed_confirmation_token: "some content", hashed_password: "some content", hashed_password_reset_token: "some content", unconfirmed_email: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
