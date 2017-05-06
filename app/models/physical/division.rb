module Physical
  class Division < ActiveRecord::Base
    belongs_to :league

    validates :name, presence: true, uniqueness: { scope: :league_id }
  end
end
