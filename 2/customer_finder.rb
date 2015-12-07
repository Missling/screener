require 'json'
require 'rubygems'
require 'fast_haversine'

class CustomerFinder
  MAX_KM_FROM_OFFICE = 100
  DUBLIN_OFFICE_COORDINATE = [53.3381985, -6.2592576]

  def initialize(file_name)
    @file_name = file_name

    parse_file
  end

  def invitees
    valid_customers
  end

  def display_invitees
    valid_customers.each do |customer|
      print "User ID: #{customer["user_id"]} "
      print "Name: #{customer["name"]} "
      print "Distance: #{customer["distance"]}\n"
    end 
  end

  private

  attr_reader :file_name, :file, :valid_customers

  def parse_file
    @file = File.open(file_name, "r+")

    find_customers_within_100_km
    sort_customers_by_user_id

    file.close
  end

  def find_customers_within_100_km
    @valid_customers = []

    file.each do |line|
      customer_json = JSON.parse(line)

      customer_json["distance"] = find_distance_from_office(customer_json)
      
      @valid_customers << customer_json if customer_json["distance"] < MAX_KM_FROM_OFFICE  
    end
  end

  def find_distance_from_office(customer)
    FastHaversine.distance_between([customer["latitude"].to_f, customer["longitude"].to_f], DUBLIN_OFFICE_COORDINATE, :km)
  end

  def sort_customers_by_user_id
    valid_customers.sort_by! { |k| k["user_id"] }
  end
end

