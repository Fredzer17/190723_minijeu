require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "| Bienvenue dans mon jeu 'Ils veulent tous ma pooooo!' |"
puts "| Le but pour vous sera de survivre aux vilains Bots!  |"
puts "-----------------------------------------------------"

puts "comment t'appelles-tu, jeune Héro?"
humanplayer_name = gets.chomp     # je stocke le nom du joueur dans une variable, que je rappelle la ligne d'après pour crééer mon Player 3 humain.

Player3= HumanPlayer.new(humanplayer_name)
Player1 = Player.new("Josiane")
Player2 = Player.new("José")

enemies= [Player1, Player2]

while Player3.life_points>0 && (Player1.life_points>0 || Player2.life_points>0)   # Tant qu'aucun joueur n'est mort, continue la boucle while.
  puts "Voici l'état de chaque joueur:"
  puts Player3.show_state
  puts Player1.show_state
  puts Player2.show_state
  puts "-------------------"    # Je rends le résultat plus lisible ici..
  puts "Quelle action veux-tu effectuer ?
        a - chercher une meilleure arme
        s - chercher à se soigner 

        attaquer un joueur en vue :
        0 - Josiane a #{Player1.life_points} points de vie
        1 - José a #{Player2.life_points} points de vie"

Player3_choice= gets.chomp    # Ici, j'indique l'action à réaliser selon l'input donné par le joueur humain.
  if Player3_choice=="a"
    Player3.search_weapon
  elsif Player3_choice == "s"
    Player3.search_health_pack
  elsif Player3_choice == "0"
    Player3.attacks(Player1)
  else Player3_choice == "1"
    Player3.attacks(Player2)
  end

  puts Player1.show_state
  puts Player2.show_state
  # if Player2.life_points<1 && Player1.life_points<1   # On sort tout de suite de la boucle si le Player2 est mort, pour éviter qu'il puisse attaqué alors qu'il est mort..
  #   break
  # end
  puts "Les autres joueurs t'attaquent!"   # Attaque de l'humain par les Bots, en utilisant l'array des ennemis.
  enemies.each do |enemie|
    enemie.attacks(Player3)
  end
  puts "----------------"
end

puts "La partie est finie"

if Player3.life_points<1
  puts "Loser ! Tu as perdu !"
else 
  puts "BRAVO ! TU AS GAGNE !"
end

