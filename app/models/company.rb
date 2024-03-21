class Company < ApplicationRecord
	validates :name, presence: true
	VALID_COMPANY_STATUSES = ["prospect", "live", "terminated"]
end
