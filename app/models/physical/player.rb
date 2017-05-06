module Physical
  class Player < ActiveRecord::Base
    belongs_to :team

    validates :avg, presence: true
    validates :at_bats, presence: true
    validates :caught_stealing, presence: true
    validates :doubles, presence: true
    validates :games, presence: true
    validates :games_started, presence: true
    validates :given_name, presence: true
    validates :hit_by_pitch, presence: true
    validates :hits, presence: true
    validates :home_runs, presence: true
    validates :ops, presence: true
    validates :pb, presence: true
    validates :player_errors, presence: true
    validates :position, presence: true
    validates :rbi, presence: true
    validates :runs, presence: true
    validates :sacrifice_flies, presence: true
    validates :sacrifice_hits, presence: true
    validates :steals, presence: true
    validates :struck_out, presence: true
    validates :surname, presence: true, uniqueness: { scope: [:given_name, :team_id] }
    validates :triples, presence: true
    validates :walks, presence: true
  end
end
