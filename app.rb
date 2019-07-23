require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


Player1 = Player.new("Josiane")    # On créée les Objets Player1 et Player2.
Player2 = Player.new("José")

while (Player1.life_points>0) || (Player2.life_points>0)    # Tant qu'aucun joueur n'est mort, continue la boucle while.
  puts "Voici l'état de chaque joueur:"
  puts Player1.show_state
  puts Player2.show_state
  puts "-------------------"    # Je rends le résultat plus lisible ici..

  puts "Passons à la phase d'attaque :"     # Attaque entre les joueurs.
  Player1.attacks(Player2)
    if Player2.life_points<0    # On sort tout de suite de la boucle si le Player2 est mort, pour éviter qu'il puisse attaqué alors qu'il est mort..
      break
    end
  Player2.attacks(Player1)
end

binding.pry
