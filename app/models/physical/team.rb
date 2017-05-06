module Physical
  class Team < ActiveRecord::Base
    belongs_to :division

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
  end
end
