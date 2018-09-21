# TASKS = [ { task: "Pluck Eyebrows", status: "incomplete"},
#  { task: "Shave toe", status: "incomplete"},
#  { task: "Collect dust bunnies", status: "complete"}]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  # params - acts like a hash, always come in as a string
  # id will come from url /books/2


  #2 use the param in the controller
  # key in params NEED TO MATCH the key in routes

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: [task_id])
    if @task.nil?
      head :not_found  #or 404.. http head: head is general to all controllers. don't send body, just send error code.
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    ) #instantiate a new book
    is_successful_save = task.save

    if is_successful_save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def edit

  end
end
