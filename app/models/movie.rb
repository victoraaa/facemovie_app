class Movie < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 50}

  def self.vote(id1, id2)
    Movie.find(id1).rating+=1
    Movie.find(id2).rating-=1
  end

end
