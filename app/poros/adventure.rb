class Adventure 
  attr_reader :id,
              :guest_email_addresses, 
              :date, 
              :comment, 
              :activites, 
              :favorite, 
              :rec_area_id 

  def initialize(data) 
    @id                    = data[:id]
    @guest_email_addresses = [].push(data[:guest_email_addresses])
    @date                  = data[:date]
    @comment               = data[:comment]
    @activities            = [].push(data[:activities])
    @favorite              = data[:favorite]
    @rec_area_id           = data[:rec_area_id]
  end
end