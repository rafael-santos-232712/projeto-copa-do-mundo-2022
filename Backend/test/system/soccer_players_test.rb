require "application_system_test_case"

class SoccerPlayersTest < ApplicationSystemTestCase
  setup do
    @soccer_player = soccer_players(:one)
  end

  test "visiting the index" do
    visit soccer_players_url
    assert_selector "h1", text: "Soccer players"
  end

  test "should create soccer player" do
    visit soccer_players_url
    click_on "New soccer player"

    fill_in "Name", with: @soccer_player.name
    fill_in "Number", with: @soccer_player.number
    fill_in "Team", with: @soccer_player.team_id
    click_on "Create Soccer player"

    assert_text "Soccer player was successfully created"
    click_on "Back"
  end

  test "should update Soccer player" do
    visit soccer_player_url(@soccer_player)
    click_on "Edit this soccer player", match: :first

    fill_in "Name", with: @soccer_player.name
    fill_in "Number", with: @soccer_player.number
    fill_in "Team", with: @soccer_player.team_id
    click_on "Update Soccer player"

    assert_text "Soccer player was successfully updated"
    click_on "Back"
  end

  test "should destroy Soccer player" do
    visit soccer_player_url(@soccer_player)
    click_on "Destroy this soccer player", match: :first

    assert_text "Soccer player was successfully destroyed"
  end
end
