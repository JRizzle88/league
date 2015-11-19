class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :edit, :update, :destroy]

  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = Summoner.all
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
  end

  # GET /summoners/new
  def new
    @summoner = Summoner.new
  end

  # GET /summoners/1/edit
  def edit
  end

  # POST /summoners
  # POST /summoners.json
  def create
    @api_key = ENV.fetch('API_KEY')
    summoner_name = params[:summoner][:name]
    @summoner_info = JSON.parse(HTTP.accept(:json).get("https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{summoner_name}?api_key=#{@api_key}").body)

    info = @summoner_info.values[0]
    id = info["id"]
    name = info["name"]
    icon = info["profileIconId"]
    level = info["summonerLevel"]

    unless Summoner.find_by(:id => id)
      @summoner = Summoner.new
      @summoner.id = id
      @summoner.name = name
      @summoner.icon = icon
      @summoner.level = level
    else
      @summoner = Summoner.find(id)
      @summoner.name = name
      @summoner.icon = icon
      @summoner.level = level
      @summoner.save
    end

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to @summoner, notice: 'Spell was successfully created.' }
        format.json { render :show, status: :created, location: @spell }
      else
        format.html { render :new }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summoners/1
  # PATCH/PUT /summoners/1.json
  def update
    respond_to do |format|
      if @summoner.update(summoner_params)
        format.html { redirect_to @summoner, notice: 'Summoner was successfully updated.' }
        format.json { render :show, status: :ok, location: @summoner }
      else
        format.html { render :edit }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summoners/1
  # DELETE /summoners/1.json
  def destroy
    @summoner.destroy
    respond_to do |format|
      format.html { redirect_to summoners_url, notice: 'Summoner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summoner
      @summoner = Summoner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summoner_params
      params[:summoner]
    end
end
