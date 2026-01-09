require "test_helper"

class CreatureTest < ActiveSupport::TestCase
  setup do
    @creature = creatures(:one)
    @c2 = creatures(:two)
  end

  test "Black, Lagoon" do
    assert_equal @creature.name, "Lagoon Black"
  end

  test "Space, Outer" do
    assert_equal @c2.name, "Outer Space"
  end
end
