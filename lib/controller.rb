# gem 'bundler'
# Bundler.require
require 'gossip' # appllent le bumdler et permettent de lire Gemfile (pas besoin mettre partout require 'gem')


class ApplicationController < Sinatra::Base # on a cree class ApCon qui herite (<) Sinatra::Base
	get '/' do # si quelqu'un va sur l'URL '/', execute le code qui suit 
		erb :index, locals: {gossips: Gossip.all} # sinatra doit aller charcher fichier index.erb
	end

	get '/gossips/new/' do
		erb :new_gossip
	end

    post '/gossips/new/' do 
	  Gossip.new(params["gossip_author"], params["gossip_content"]).save
	  redirect '/'
	  # Le programme va récupérer les informations du formulaire avec params 
	  # enregistre ces info dans CSV vie Gossip
	  # redirect vers la page l'acc.
  end

   	get '/show/:id/' do
   		erb :show, locals: {id: params[:id], show: Gossip.find(params[:id].to_i) }
	 end




  	# post '/gossips/new/' do
  		# puts "Salut, je suis dans le serveur"
  		# puts "Ceci est le contenu du hash params : #{params}"
  		# puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  		# puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  		# puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
	# end

end # class

