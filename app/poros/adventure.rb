class Adventure 
  attr_reader :guest_email_addresses, 
              :date, 
              :comment, 
              :activites, 
              :favorite, 
              :rec_area_id 

  def initialize(data) 
    @guest_email_addresses = [].push(data[:guest_email_addresses])
    @date                  = data[:date]
    @comment               = data[:comment]
    @activities            = data[:activites]
    @favorite              = data[:favorite]
    @rec_area_id           = data[:rec_area_id]
  end
end