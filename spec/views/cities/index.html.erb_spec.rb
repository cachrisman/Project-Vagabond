require 'rails_helper'

RSpec.describe "cities/index.html.erb", type: :view do
  before(:all) do
    @city1 = City.create({
      name: "San Francisco",
      continent: "North America"
    })
    @city2 = City.create({
      name: "London",
      continent: "Europe"
    })
    @city3 = City.create({
      name: "Tokyo",
      continent: "Asia"
    })
  end

  it "displays continent" do
    render
    expect(rendered).to match(/North America/)
    expect(rendered).to match(/Europe/)
    expect(rendered).to match(/Asia/)
  end

  it "displays the name of city" do
    render
    expect(rendered).to match(/San Francisco/)
    expect(rendered).to match(/London/)
    expect(rendered).to match(/Tokyo/)
  end

  after(:all) do
    #teardown
    @city1.destroy
    @city2.destroy
    @city3.destroy
  end

end
