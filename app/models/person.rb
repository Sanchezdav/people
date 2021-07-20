# frozen_string_literal: true

class Person
  include ActiveModel::Serializers::JSON

  # For now I just want to build my Person object with these attributes
  PERMITTED_ATTRIBUTES = ['id', 'display_name', 'email_address', 'title']

  attr_accessor :id, :display_name, :email_address, :title

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value) if PERMITTED_ATTRIBUTES.include?(key)
    end
  end

  def attributes
    instance_values
  end
end
