class Deploy < ActiveRecord::Base
  validates :application, presence: true
  validates :version, presence: true
  validates :environment, presence: true

  before_create :deactivate_previous_deploys

  def deactivate_previous_deploys
    previous_deploys = Deploy.where(active: true, application: self.application, environment: self.environment)
    previous_deploys.each do |previous_deploy|
      previous_deploy.update_attributes(active: false)
    end
  end

end
