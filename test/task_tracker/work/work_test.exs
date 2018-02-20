defmodule TaskTracker.WorkTest do
  use TaskTracker.DataCase

  alias TaskTracker.Work

  describe "tasks" do
    alias TaskTracker.Work.Task

    @valid_attrs %{body: "some body", finished: true, title: "some title", used_time: 42}
    @update_attrs %{body: "some updated body", finished: false, title: "some updated title", used_time: 43}
    @invalid_attrs %{body: nil, finished: nil, title: nil, used_time: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Work.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Work.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Work.create_task(@valid_attrs)
      assert task.body == "some body"
      assert task.finished == true
      assert task.title == "some title"
      assert task.used_time == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Work.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.body == "some updated body"
      assert task.finished == false
      assert task.title == "some updated title"
      assert task.used_time == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_task(task, @invalid_attrs)
      assert task == Work.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Work.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Work.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Work.change_task(task)
    end
  end
end
