class ChampionsController < ApplicationController
  before_action :set_champion, only: [:show, :edit, :update, :destroy]

  def index
    @champions = Champion.all
    @spells = Spell.all
  end

  def show
    @spells = Spell.where(champion_id: @champion.id)
    @q = @spells.first
    @w = @spells[1]
    @e = @spells[2]
    @r = @spells.last
  end

  def create
    @champion = Champion.new(champion_params)

    respond_to do |format|
      if @champion.save
        format.html { redirect_to @champion, notice: 'Champion was successfully created.' }
        format.json { render :show, status: :created, location: @champion }
      else
        format.html { render :new }
        format.json { render json: @champion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @champion.destroy
    respond_to do |format|
      format.html { redirect_to champions_url, notice: 'Champion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def compare
    @champion_1 = Champion.find(params[:champ1])
    @champion_2 = Champion.find(params[:champ2])
  end

  private
    def set_champion
      @champion = Champion.find(params[:id])
    end

    def champion_params
      params[:champion]
    end
end
