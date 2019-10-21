# contient les info necessaires au lancement de notre serveur.
# .ru est juste un fichier rack up

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController # on demandes au serveur d'executer class AppC..etc

