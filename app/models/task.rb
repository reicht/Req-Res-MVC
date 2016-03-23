require 'json'

class Task
  attr_accessor :first_name, :last_name, :age, :id

  def initialize()

  end

  def all
    TASK_LIST.to_json
  end

  def show(target)
    user = TASK_LIST[target[:params][:id].to_i-1]
    return user.to_json
  end

  def not_found
    return "Not Found".to_json
  end

end
