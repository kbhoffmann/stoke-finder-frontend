class AdventuresFacade 
  def self.adventure_create(adventure_params)
    AdventuresService.adventure_create(adventure_params)
  end
end