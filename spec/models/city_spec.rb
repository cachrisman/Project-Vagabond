require 'rails_helper'

RSpec.describe City, type: :model do
  #setup
  before(:all) do
    @city = City.create({
      name: "San Francisco",
      continent: "North America"
    })
  end

  it "has both city and continent names" do
    #verify
    expect(@city.name).to equal("San Francisco")
    expect(@city.continent).to equal("North America")
  end

  after(:all) do
    #teardown
    @city.destroy
  end

end
