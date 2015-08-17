defmodule Server.Movie do
  use Server.Web, :model

  schema "movies" do
    field :title, :string
    field :poster, :string
    field :year, :integer

    timestamps
  end

  @required_fields ~w(title year)
  @optional_fields ~w(poster)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:title, name: :movies_title_year_index)
  end
end
