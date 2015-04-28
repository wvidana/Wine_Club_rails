require 'test_helper'
require "pry"

class Vin::SubControllerTest < ActionController::TestCase

  def initialize(options={})
    super(options)
    @sub_json = read_sub
  end

  def read_data example
    file = File.read(File.join(Rails.root, "lib","data", example))
    JSON.parse(file)
  end

  def read_sub example="sub2.json"
    read_data example
  end

  test "should get create" do
    get :create, @sub_json
    assert_response :success
  end

  test "should get create error (subscriber already registered)" do
    get :create, read_sub("sub.json")
    msg = JSON.parse(@response.body)
    assert_equal(["Subscriber already registered!"], msg["errors"], "Got: #{msg}")
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should get update" do
    get :update, @sub_json.merge({id: 1})
    assert_response :success
  end

  test "should get update error" do
    get :update, {id: 1, subscriber: {address: { state: "" }}}
    msg = JSON.parse(@response.body)
    puts "Mensage de error...#{msg}"
    assert_not_equal({ errors: [] }, msg)
  end

end