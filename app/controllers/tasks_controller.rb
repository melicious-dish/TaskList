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
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found  #or 404.. http head: head is general to all controllers. don't send body, just send error code.
    end
  end

  def new #show
    @task = Task.new
  end

  def create #do
    filtered_task_params = task_params()
    @task = Task.new(filtered_task_params) #instantiate a new book

    is_successful_save = @task.save

    if is_successful_save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def mark_complete
    task = Task.find_by(id: params[:id])
    task.update(completion_date: 'Complete')
    redirect_to tasks_path
  end

  def edit #show a form
    @task = Task.find_by(id: params[:id])
  end


  def update #create a new form #do
    task = Task.find(params[:id])
    task.update(task_params)
    # update is a rails method
    redirect_to task_path
  end



  def destroy
    task = Task.find_by(id: params[:id])

    task.destroy
    redirect_to tasks_path # with s is a collection - index route
             # task_path is one path and needs an :id paramater

             # add a condiiional here
  end

  private

  def task_params
    # only take in these params. Lesson attacks on site
    return params.require(:task).permit(
      :action,
      :description,
      :completion_date
    )
  end

end
