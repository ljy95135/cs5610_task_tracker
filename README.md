# Design

## Feature
In this app, you can:
  * Register with a name and email, they are all unique in database column.
  * Login with your email, a not-exist email will get a error info.
  * You can logout through hyperlink Logout on the top right.
  * When you login, you can use hyperlink Task on the top right.
  * In the task, you can assign a new assignment to some user by their user name.
  * You can only see your assignment, for example, Alcie gives Tom a work, and then logout and login as Tom, Tom gives Alice a work, login as Alice, then only the work assigned to Alice can be seen.
  * You can edit the time, whether is finished.
  * You can see all the information of the assignment in one page.

## Choice
I designed this task tracker app with all requirement. However, requirement can not tell programmer every action to do, so I make some choices which I think is approriate now. There are also things I think could be changed in the future.

  * I choose user's email as the login entry and user's name as the assignment entry, because both of them are unique in my database and I think use email as an entry is not a bad idea and when you want to give someone a work, you may want to write user name instead of the email.
  * Every task when created is not finished, you can change them when the assigned person choose to do that, because there is no need to assign a finished work.
  * The used time must be some multiple of 15, and I choose to use change the totall time instead of add time, because someone maybe want to change the used time to a small number then add some negative number seems strange.

## TODO
There are some modification can be done.
  * I do not change the redirect so every time you add a task, you have to click Task link manually or go to /task by URL. It can be changed to a user-friendly behaviour.
  * The task can be sortec more clever like put the finished one at the last.
  * Everyone can go to /users or /tasks, which is quite dangerous.
  * Password and so on.

&nbsp;
&nbsp;

Jiangyi Lin

# TaskTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
