class AdventureFacade 
  def self.adventure_create(adventure_params)
    require 'pry'; binding.pry
    AdventureService.create(adventure_params)
  end
end