module Physical
  class Season < ActiveRecord::Base
    has_many :leagues

    validates :year, presence: true, uniqueness: true
  end
end
