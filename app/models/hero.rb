class Hero

  attr_accessor :name, :power, :bio

  @@all = []

  def initialize(params)
    params.each do {|k,v| self.send("#{k}= #{v}")unless v.is_a?(Array)}
    self.class.all << self
  end

  def self.all
    @@all
  end
end
