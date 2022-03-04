class AdventuresFacade 
  def self.adventure_create(adventure_params)
    AdventureService.adventure_create(adventure_params)
  end
end