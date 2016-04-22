class DashboardController < ApplicationController

  def index
    @applications = {}
    deploys = Deploy.where(active: true).order("created_at DESC")
    deploys.each do |deploy|
      @applications[deploy.application] = [] if ! @applications[deploy.application]
      @applications[deploy.application] << {environment: deploy.environment, version: deploy.version}
    end
  end

end
