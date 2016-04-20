class DeploysController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index 
    @applications = {}
    deploys = Deploy.where(active: true).order("created_at DESC")
    deploys.each do |deploy|
      @applications[deploy.application] = [] if ! @applications[deploy.application]
      @applications[deploy.application] << {environment: deploy.environment, version: deploy.version}
    end
    render :json => @applications, status: 200
  end

  def create
    deploy = Deploy.new(deploy_params)
    if deploy.valid?
      deploy.save
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
