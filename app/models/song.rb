class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: {scope: :release_year}
	validates :released, inclusion: {in: [true, false]}
	validates :genre, presence: true
	validates :artist_name, presence: true
	validates :release_year, presence: true, if: :released
	validate :release_year_less_than_current, if: :released, if: :release_year

	def release_year_less_than_current
    if release_year > Time.now.year
      errors.add(:release_year, "can't be later than current year")
    end
  end

end
