defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def task(conn, _params) do
    tasks = TaskTracker.Work.list_tasks()
    changeset = TaskTracker.Work.change_task(%TaskTracker.Work.Task{})
    render conn, "task.html", tasks: tasks, changeset: changeset
  end
end
