namespace :champs do

  @api_key = ENV.fetch('API_KEY')

  desc "gets all the champions"
  task :get_champions => :environment do
    get_champion_list
    get_champion_names
    get_stats
    get_spells
  end

  desc "gets summoner info"
  task :get_summoner => :environment do
    get_summoner_info("a lvl 69 boner")
  end

  def get_champion_list


    champions_list = JSON.parse(HTTP.accept(:json).get("https://na.api.pvp.net/api/lol/na/v1.2/champion?api_key=#{@api_key}").body)
    champions = champions_list['champions']

    champions.each do |champion|
      champion = champion.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      champion[:free] = champion.delete(:freeToPlay)
      champion[:ranked] = champion.delete(:rankedPlayEnabled)
      champion.delete(:botMmEnabled)
      champion.delete(:botEnabled)

      unless Champion.find_by(id: champion[:id])
        new_champ = Champion.new(champion)
        new_champ.save
      else
        Champion.find_by(id: champion[:id]).update_attributes(champion)
      end
    end
  end

  def get_champion_names
    @champions_list = JSON.parse(HTTP.accept(:json).get("https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=all&api_key=#{@api_key}").body)

    champion_names = @champions_list['keys']

    champion_names.each do |champion|
      champ = Champion.find_by(id: champion.first)
      champ.name = champion.last
      champ.save
    end
  end

  def get_stats
    @champions_list["data"].each do |champion|
      champ = Champion.find_by(name: champion.first)
      champ.update_attributes(champion.last["stats"])
      champ.save
    end
  end

  def get_spells
    @champions_list["data"].each do |champion|
      champ = Champion.find_by(name: champion.first)
      champion.last["spells"].each do |spell|
        new_spell = Spell.new
        new_spell.name = spell["name"]
        new_spell.champion_id = champ.id
        new_spell.description = spell["description"]
        new_spell.cost = spell["cost"].to_s
        new_spell.cooldown = spell["cooldown"].to_s
        new_spell.range = spell["range"].to_s
        new_spell.key = spell["key"]
        new_spell.save
      end
    end
  end

  def get_summoner_info(summoner_name)
    @summoner_info = JSON.parse(HTTP.accept(:json).get("https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{summoner_name}?api_key=#{@api_key}").body)
    info = @summoner_info.values[0]
    id = info["id"]
    name = info["name"]
    icon = info["profileIconId"]
    level = info["summonerLevel"]
  end
end
