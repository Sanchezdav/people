# frozen_string_literal

class PeopleController < ApplicationController
  before_action :verify_api_key

  def index
  end

  private

  def verify_api_key
    redirect_to root_path, alert: 'API Key is not present' if ENV['API_KEY'].nil?
  end
end
