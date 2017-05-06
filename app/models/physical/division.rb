module Physical
  class Division < ActiveRecord::Base
    belongs_to :league

    validates :league_id, presence: true
    validates :name, presence: true, uniqueness: {
      scope: :league_id, case_sensitive: false
    }
  end
end
