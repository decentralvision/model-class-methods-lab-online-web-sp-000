class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    all.take(5)
  end

  def self.dinghy
    where ("length < 20")
  end
  
  def self.ship
    where("length >= 20")
  end

  def self.last_three_alphabetically
    all.order(:name).last(3).reverse
  end

  def self.without_a_captain
    all.select{|boat| !boat.captain}
  end

  def self.sailboats
    all.select{|boat| boat.classifications.any? {|clss| clss.name == "Sailboat"}}
  end

  def self.with_three_classifications
    all.select{|boat| boat.classifications.length >= 3}
  end
  
  def self.longest
    order('length DESC').first
  end
end
