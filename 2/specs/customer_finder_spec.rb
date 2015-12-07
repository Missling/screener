require './customer_finder'

describe CustomerFinder do
  let(:customer_finder) { CustomerFinder.new("customers_test_data.txt") } 

  it "should only return customers within 100km from office" do
    expected_invitees = [
      {
        "latitude" => "53.1489345",
        "user_id" => 31,
        "name" => "Alan Behan",
        "longitude" => "-6.8422408",
        "distance" => 44.132860961349785
      },
      {
        "latitude" => "53.0033946",
        "user_id" => 39,
        "name" => "Lisa Ahearn",
        "longitude" => "-6.3877505",
        "distance" => 38.20092613347065
      }
    ]

    expect(customer_finder.invitees).to eq(expected_invitees)
  end

  it "should return customers sorted by user_id" do
    user_ids = customer_finder.invitees.map {|i| i["user_id"]}

    expect(user_ids).to eq(user_ids.sort)
  end
end