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
    |> validate_change(:used_time, fn :used_time, time ->
        if multiple15(time) do
          []
        else
          [used_time: "must be 15's multiple"]
        end
    end)
  end



  def multiple15(time) do
    rem(time, 15) == 0
  end

end