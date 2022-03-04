class AdventuresFacade 
  def self.adventure_create(adventure_params)
    data = AdventureService.adventure_create(adventure_params)
    Adventure.new(data[:data][:attributes])
  end
end