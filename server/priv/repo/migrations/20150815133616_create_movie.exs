defmodule Server.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :poster, :string

      timestamps
    end

  end
end
