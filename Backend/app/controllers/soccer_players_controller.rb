class SoccerPlayersController < ApplicationController
  before_action :set_soccer_player, only: %i[ show edit update destroy ]

  # GET /soccer_players or /soccer_players.json
  def index
    @soccer_players = SoccerPlayer.all
  end

  # GET /soccer_players/1 or /soccer_players/1.json
  def show
  end

  # GET /soccer_players/new
  def new
    @soccer_player = SoccerPlayer.new
    @teams = Team.all
  end

  # GET /soccer_players/1/edit
  def edit
    @teams = Team.all
  end

  # POST /soccer_players or /soccer_players.json
  def create
    @soccer_player = SoccerPlayer.new(soccer_player_params)

    respond_to do |format|
      if @soccer_player.save
        format.html { redirect_to soccer_player_url(@soccer_player), notice: "Soccer player was successfully created." }
        format.json { render :show, status: :created, location: @soccer_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @soccer_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soccer_players/1 or /soccer_players/1.json
  def update
    respond_to do |format|
      if @soccer_player.update(soccer_player_params)
        format.html { redirect_to soccer_player_url(@soccer_player), notice: "Soccer player was successfully updated." }
        format.json { render :show, status: :ok, location: @soccer_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @soccer_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soccer_players/1 or /soccer_players/1.json
  def destroy
    @soccer_player.destroy!

    respond_to do |format|
      format.html { redirect_to soccer_players_url, notice: "Soccer player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soccer_player
      @soccer_player = SoccerPlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def soccer_player_params
      params.require(:soccer_player).permit(:name, :number, :team_id)
    end
end
