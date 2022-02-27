class Activity
  attr_reader :name

  def initialize(data)
    # @id = data[:ActivityID]
    @name = data[:ActivityName]
  end
end
