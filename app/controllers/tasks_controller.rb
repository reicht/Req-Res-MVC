class TasksController < ApplicationController

  def initialize(target)
    @target=target
    @params = @target[:params]
  end

  def index
    if @target[:format] == "json"
      render $task_list.to_json
    else
    render_template 'tasks_list.html.erb'
    end
  end

  def show
    task = targetting
    if task
      if @target[:format] == "json"
        render task.to_json
      else
        @task = task
        render_template 'view_task.html.erb'
      end
    else
      render_not_found
    end
  end

  def create
    $task_list << Task.new(@params["body"])
    render({ message: "Successfully created new task!" }.to_json)
  end

  def update
    task = targetting

    if task
      unless @params["body"].nil? || @params["body"].empty?
        task.body = @params["body"]
      end

      unless @params["completed"].nil? || @params["completed"].empty?
        task.completed = @params["completed"]
      end

      render task.to_json, status: "200 OK"
    else
      render_not_found
    end
  end

  def complete_task
    @params["completed"] = "true"
    update
  end

  def destroy
    task = targetting

    if task
      $task_list.delete(task)
      render({ message: "Successfully Deleted Task" }.to_json)
    else
      render_not_found
    end
  end

  private

  def targetting
    $task_list.find { |task|  task.id == @params[:id].to_i}
  end

  def render_not_found
    return_message = {
      message: "User not found!",
      status: '404'
    }.to_json

    render return_message, status: "404 NOT FOUND"
  end

end
