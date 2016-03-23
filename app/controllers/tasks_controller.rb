class TasksController < ApplicationController

  def initialize(target)
    @target=target
  end

  def index
    render Task.new.all
  end

  def show
    user = find_user_by_id
    if user
      render user.to_json
    else
      render_not_found
    end
  end

  def create
    puts "Under construction"
  end

  def update
    user = find_user_by_id

    if user
      unless params["name"].nil? || params["name"].empty?
        user.name = params["name"]
      end

      unless params["age"].nil? || params["age"].empty?
        user.age = params["age"]
      end

      # In rails you will need to call save here
      render user.to_json, status: "200 OK"
    else
      render_not_found
    end
  end

  def destroy
    user = find_user_by_id

    if user
      TASK_LIST.delete(user) # destroy it 🔥
      render({ message: "Successfully Deleted User" }.to_json)
    else
      render_not_found
    end
  end

  private

  def find_user_by_id
    params = @target[:params]
    TASK_LIST.find { |task|  task[:id] == params[:id].to_i}
  end

  def render_not_found
    return_message = {
      message: "User not found!",
      status: '404'
    }.to_json

    render return_message, status: "404 NOT FOUND"
  end

end
