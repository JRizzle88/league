class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :edit, :update, :destroy]

  def home
    @new_summoner= Summoner.new
    summoner_name = cookies[:summoner]
    @summoner = Summoner.find_by(:name => summoner_name)
  end

  def create
    summoner_name = params[:summoner][:name]

    @summoner_info = JSON.parse(HTTP.accept(:json).get("https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{summoner_name}?api_key=#{$api}").body)
    @summoner = Summoner.new
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

    cookies[:summoner] = name

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to action: "home", notice: 'created' }
      end
    end
  end

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

  private
    def set_summoner
      @summoner = Summoner.find(params[:id])
    end

    def summoner_params
      params[:summoner]
    end
end
