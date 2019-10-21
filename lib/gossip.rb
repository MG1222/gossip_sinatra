# notre model !
require 'csv'

#require 'pry'

class Gossip
  attr_reader :author, :content # on peux pas changer

	def initialize(author,content) # n'oublie pas ca ( , )!
		@author = author
		@content = content
	# attributs sont declares a l'init.
	end

	def save
		# elle ira ecrire dans un fichier CSV notre instance de Gossip
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content] 
		end
		# puts "save"
	end

	def self.all # va lire chaque ligne du CSV
		all_gossip = []
		CSV.read("./db/gossip.csv").each do |ligne| 
			all_gossip << Gossip.new(ligne[0], ligne[1])
		end
		all_gossip # return all_gos.
	end

	def self.find(gossip_id) # on appeles all
    return all[gossip_id - 1]
  end

	



end # fin class	
#binding.pry