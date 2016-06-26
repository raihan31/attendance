class Attend < ActiveRecord::Base
  belongs_to :user
  def self.current_date_attendances
    where(in_date: Date.today)
  end
end
