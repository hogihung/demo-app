class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :owner, presence: true
  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: SUBDOMAIN_REGEX, message: 'contains invalid characters' },
                        exclusion: { in: EXCLUDED_SUBDOMAINS, message: 'restricted' }

  accepts_nested_attributes_for :owner

  before_validation :downcase_subdomain

  private
  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
