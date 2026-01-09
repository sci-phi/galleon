require "test_helper"

class CreaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creature = creatures(:one)
  end

  test "should get index" do
    get creatures_url, as: :json

    assert_response :success
  end

  test "should create creature" do
    assert_difference("Creature.count") do
      post creatures_url,
        params: {
          creature: {
            name: "Test Creature"
          }
        }
    end

    assert_response :created
  end

  test "should show creature" do
    get creature_url(@creature), as: :json
    assert_response :success
  end

  test "should update creature" do
    patch creature_url(@creature),
      params: {
        creature: {
          name: "Updated Creature"
        }
      }

    assert_response :success
    assert_equal "Updated Creature", @creature.reload.name
  end

  test "should destroy creature" do
    assert_difference("Creature.count", -1) do
      delete creature_url(@creature), as: :json
    end

    assert_response :no_content
  end
end
