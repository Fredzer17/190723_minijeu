# On définit notre classe Player ici, et 2 objets.
class Player   
  attr_accessor :name, :life_points
  @life_points=10

  # On initialise avec 2 Objets.
  def initialize(name)
    @name = name
    @life_points = 10
  end

  #On montre ici l'état du combattants (nb de points de vie restants)
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  # def pour indiquer si le joueur est mort ou pas.
  def gets_damage(damage_points)
    @life_points = @life_points - damage_points
      if @life_points <= 0       #Si le niveau de vie de l'objet est inférieur ou égal à zéro, le joueur est tué et on affiche un message.
        puts "le joueur #{@name} a été tué!"   
      end
  end

  def attacks(player_attacked)
    puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"   
    damage_points = compute_damage
    player_attacked.gets_damage(damage_points)    # On fait infliger les points de dommage au joueur attaqué.
    puts "il lui inflige #{damage_points} points de dommages"
  end

  def compute_damage
    return rand(1..6)   # Choix au hasard entre 1 et 6 points de dommages"
  end
end





class HumanPlayer < Player
  attr_accessor :weapon_level   # Définition de la variable weapon_level qui indiquera sous forme d'integer le niveau de l'arme du HumanPlayer.

  # On initialise avec 2 Objets.
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  #On montre ici l'état du combattants (nb de points de vie restants)
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  # #Ici on va tomber sur une nouvelle arme (au hasard entre 1 et 6 de niveau)
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
      if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level 
        puts "Youhou, elle est meilleure que ton arme actuelle: tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
  end


  # Méthode pour trouver des points de vie.
  def search_health_pack
    dice_roll = rand(1..6)
    if dice_roll==1       # Le If ici va dire ce qu'il arrive en fonction du jeté de dé.
      puts "Tu n'as rien trouvé."
    elsif (dice_roll>1) && (dice_roll<6)  
      @life_points = @life_points+50
        if @life_points>100
          @life_points = 100
        end
      puts "Bravo, tu as trouvé un pack de +50 points de vie!"
    else dice_roll == 6
      @life_points = @life_points+80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
        if @life_points>100
          @life_points = 100
        end
    end
  end
end
