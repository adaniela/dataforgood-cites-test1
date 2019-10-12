

# url = 'https://query.wikidata.org/sparql?format=json&query=SELECT%20distinct%20%20%3FtaxonRank%20%3FidCITES%20%20%3FnomSc%0AWHERE%20%7B%0A%20%3Fitem%20wdt%3AP2040%20%3FidCITES%20.%0A%20%3Fitem%20wdt%3AP225%20%3FnomSc%20.%0A%20%3Fitem%20wdt%3AP105%20%3FtaxonRank%0A%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP18%20%3Fimage%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22fr%22%20%7D%0A%7D%0A'
# #User-Agent: EndangeredSpeciesIdentifier/0.1 (contact@okfnfr; http://cites.okfn.fr/en/home/)

# trials : rajouter un head sur la requete get http

# response.set_header('HEADER NAME', 'HEADER VALUE')
#   response.set_header('User-Agent', 'EndangeredtaxonsIdentifier/0.1 (contact@okfnfr; http://cites.okfn.fr/en/home/)')

# #Species.new('http://example.com', headers: { 'User-Agent' => 'EndangeredSpeciesIdentifier/0.1 (contact@okfnfr; http://cites.okfn.fr/en/home/)' }).get


require 'json'
require 'open-uri'

url = "https://gist.githubusercontent.com/adaniela/f61794062efd85deb9c5eb543cdaf10f/raw/006531e3d95688d29f5d9960c805929409a161e5/wiki-species-19994.json"

Organism.delete_all

organisms = JSON.parse(open(url).read)
organisms.each do |organism|
  puts organism
  # Organism.create!(
  #   taxonRank: organism["taxonRank"],
  #   idCITES: organism["idCITES"],
  #   nomSC: organism["nomSC"],

  #   )
end
puts 'Organisms created!'


# idCITES: organism["idCITES"]
# item: organism["item"]
# itemLabel: organism["itemLabel"]
# taxonRank: organism["taxonRank"]
# nomScientific: organism["nomScientific"]
# taxonCommonName: organism["taxonCommonName"]
# taxonCommonName_lang: organism["taxonCommonName_lang"]
# Image: organism ["Image"]

