defmodule MediaBot.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :hashed_password, :string
      add :hashed_confirmation_token, :string
      add :confirmed_at, :datetime
      add :hashed_password_reset_token, :string
      add :unconfirmed_email, :string
      add :authentication_tokens, {:array, :string}, default: []
    end

    create unique_index(:users, [:username])
  end
end
