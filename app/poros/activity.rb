class Activity
  attr_reader :id,
              :name,
              :description,
              :rec_area_id

  def initialize(data)
    @id = data[:ActivityID]
    @name = data[:ActivityName]
    @description = data[:RecAreaActivityDescription]
    @rec_area_id = data[:RecAreaID]
    @activity_fee = data[:RecAreaActivityFeeDescription]
  end

  def fee
    if @activity_fee == ""
      "Information Not Available"
    else
      @activity_fee
    end
  end
end
