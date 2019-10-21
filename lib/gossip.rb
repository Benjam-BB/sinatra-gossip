require "csv"
require 'pry'

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end	

	def save #sauvegarde dans le CSV
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id) #pour charger l'id de chaque page
        id = id.to_i
        all_gossips = self.all
        all_gossips.each_index{|index| if index == id then return all_gossips[index] end}
    end

    def update(author, content) #pour modifiet le contenu (mais ça ne fonctionne pas)
        @author = author
        @content = content
        return self
     end
end