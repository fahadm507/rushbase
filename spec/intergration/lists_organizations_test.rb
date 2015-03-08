require 'rails_helper'

class ListingOrganizationTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com'}

  test 'returns list of all zombies' do
    get '/organizations'
    assert_equal 200, response.status
    refuse_empty response.body
  end

  test 'returns organzation filtered by name' do
    foo = Organization.create!(name: 'teachers')
    bar = Organization.create!(name: 'NortheasternUniversity')
    get '/organizations?name=teachers'

    assert_equal 200, response.status

    organizations = JSON.parse(response.body, symbolize_names: true)
    names = organizations.collect {|org| org[:name] }
    assert_includes names, 'fo'
    refute_includes names, 'joseph'
  end
end
