class Song < ActiveRecord::Base
	validates :title, presence:true, uniqueness: {scope: :release_year}
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, presence: true, if: :released?
	validate :release_year_cannot_be_in_the_future
	validates :artist_name, presence:true


	def released?
		released == true
	end

	def release_year_cannot_be_in_the_future
    	if release_year.present? && release_year >= Date.today.year
      errors.add(:release_year, "cannot be in the future")
  		end
  	end

end