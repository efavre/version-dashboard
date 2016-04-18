class Deploy < ActiveRecord::Base
  validates :application, presence: true
  validates :version, presence: true
  validates :environment, presence: true
end
