# frozen_string_literal

require 'net/http'

class PeopleController < ApplicationController
  before_action :verify_api_key

  def index
    @people = people_list.map { |item| Person.new.from_json(item.to_json) }
  end

  private

  def verify_api_key
    redirect_to root_path, alert: 'API Key is not present' if ENV['API_KEY'].nil?
  end

  def people_list
    api_key = ENV['API_KEY']
    uri = URI('https://api.salesloft.com/v2/people.json')
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{api_key}"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http|
      http.request(req)
    }
    parsed_response = JSON.parse(response.body)
    parsed_response['data']
  end
end
