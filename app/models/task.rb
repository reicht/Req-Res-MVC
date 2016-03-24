require 'json'

class Task
  attr_accessor :body, :completed, :id

  def initialize(body, id = -1)
    if id == -1
      @id = Task.get_id
    else
      @id = id
    end
    @body = body
    @completed = "false"
  end

  def Task.setup
    id = Task.get_id
    new(BODY_LIST[id-1], id)
  end

  def not_found
    return "Not Found".to_json
  end

  def Task.get_id
    $given_ids += 1
  end

  def to_json(_ = nil)
    {
      id: id,
      body: body,
      completed: completed
    }.to_json
  end
end
