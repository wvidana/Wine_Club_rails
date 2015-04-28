require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "serializable_hash updated_at" do
    out = admins(:one).serializable_hash.symbolize_keys
    assert_nil(out[:updated_at], "Updated_At is outputed!")
    assert_nil(out[:created_at], "Created_At is outputed!")
  end
end
