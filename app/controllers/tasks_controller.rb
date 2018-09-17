TASKS = [ { task: "Pluck Eyebrows", status: "incomplete"},
 { task: "Shave toes", status: "incomplete"},
 { task: "Collect dust bunnies", status: "complete"}]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
