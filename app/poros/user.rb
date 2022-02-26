class User
  attr_reader :id, :name

  def initialize(data)
    binding.pry
    @id = data[:id]
    @name = data[:attributes][:name]
  end
end
