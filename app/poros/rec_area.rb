class RecArea
  attr_reader :name,
              :id,
              :description,
              :directions,
              :activities
  def initialize(data)
    @name = data[:RecAreaName]
    @id = data[:RecAreaId]
    @description = data[:RecAreaDescription]
    @directions = data[:RecAreaDirections]
    @activities = data[:ACTIVITY]
  end
end