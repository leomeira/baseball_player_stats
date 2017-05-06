module Physical
  class SeasonsLeague < ActiveRecord::Base
    belongs_to :league
    belongs_to :season
  end
end
