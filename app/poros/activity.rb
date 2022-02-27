class Activity
  attr_reader :id,
              :name
  def initialize(data)
    @id = data[:ActivityID]
    @name = data[:ActivityName]
  end
end