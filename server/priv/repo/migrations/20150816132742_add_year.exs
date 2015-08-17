defmodule Server.Repo.Migrations.AddYear do
  use Ecto.Migration

  def change do
    alter table(:movies) do
      add :year, :integer
    end

    create index(:movies, [:title, :year], unique: true)
  end
end
