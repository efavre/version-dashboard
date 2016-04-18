class DeploysController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index 
    @applications = {}
    deploys = Deploy.all.order("created_at DESC").group("application, environment")
    deploys.each do |deploy|
      @applications[deploy.application] = [] if ! @applications[deploy.application]
      @applications[deploy.application] << {environment: deploy.environment, version: deploy.version}
    end
  end

  def create
    deploy = Deploy.new(deploy_params)
    if deploy.save
      render :json => deploy, status: 200
    else
      render :json => {message: "missing paramters"}, status: 400
    end
  end

private

  def deploy_params
    params.require(:deploy).permit(:application, :version, :environment)
  end

end
