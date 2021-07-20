# frozen_string_literal: true

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :first_name, :last_name, :display_name, :email_address,
                :title, :created_at, :updated_at
end
