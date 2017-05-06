module Physical
  class Season < ActiveRecord::Base
    has_many :leagues

    validates :year, presence: true, uniqueness: true, case_sensitive: false
  end
end
