require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "if model can be save with null atributtes" do
    c = Category.new
    assert !c.save
  end
end
