module Physical
  class Team < ActiveRecord::Base
    belongs_to :division

    validates :city, presence: true
    validates :division_id, presence: true
    validates :name, presence: true, uniqueness: true
  end
end
