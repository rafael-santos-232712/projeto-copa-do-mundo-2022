require "test_helper"

class SoccerPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soccer_player = soccer_players(:one)
  end

  test "should get index" do
    get soccer_players_url
    assert_response :success
  end

  test "should get new" do
    get new_soccer_player_url
    assert_response :success
  end

  test "should create soccer_player" do
    assert_difference("SoccerPlayer.count") do
      post soccer_players_url, params: { soccer_player: { name: @soccer_player.name, number: @soccer_player.number, team_id: @soccer_player.team_id } }
    end

    assert_redirected_to soccer_player_url(SoccerPlayer.last)
  end

  test "should show soccer_player" do
    get soccer_player_url(@soccer_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_soccer_player_url(@soccer_player)
    assert_response :success
  end

  test "should update soccer_player" do
    patch soccer_player_url(@soccer_player), params: { soccer_player: { name: @soccer_player.name, number: @soccer_player.number, team_id: @soccer_player.team_id } }
    assert_redirected_to soccer_player_url(@soccer_player)
  end

  test "should destroy soccer_player" do
    assert_difference("SoccerPlayer.count", -1) do
      delete soccer_player_url(@soccer_player)
    end

    assert_redirected_to soccer_players_url
  end
end
