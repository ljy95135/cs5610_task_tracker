defmodule TaskTracker.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Work.Task


  schema "tasks" do
    field :body, :string
    field :finished, :boolean, default: false
    field :title, :string
    field :used_time, :integer
    belongs_to :user, TaskTracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :finished, :used_time, :user_id])
    |> validate_required([:title, :body, :finished, :used_time, :user_id])
  end
end
