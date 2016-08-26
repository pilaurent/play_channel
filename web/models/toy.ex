defmodule PlayChannel.Toy do
  use PlayChannel.Web, :model

  schema "toys" do
    field :name, :string
    field :color, :string
    field :age, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :color, :age])
    |> validate_required([:name, :color, :age])
  end
end
