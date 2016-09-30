class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets.fetch(:dogs).each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets.fetch(:cats).each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets.fetch(:fishes).each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.map do |pet_type, info|
      @pets[pet_type].map do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    cats = @pets[:cats].length
    dogs = @pets[:dogs].length
    fishes = @pets[:fishes].length
    "I have #{fishes} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end
end
