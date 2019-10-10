require 'json'
require 'open-uri'
url = 'https://query.wikidata.org/sparql?format=json&query=SELECT%20distinct%20%20%3FtaxonRank%20%3FidCITES%20%20%3FnomSc%0AWHERE%20%7B%0A%20%3Fitem%20wdt%3AP2040%20%3FidCITES%20.%0A%20%3Fitem%20wdt%3AP225%20%3FnomSc%20.%0A%20%3Fitem%20wdt%3AP105%20%3FtaxonRank%0A%20OPTIONAL%20%7B%20%3Fitem%20wdt%3AP18%20%3Fimage%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22fr%22%20%7D%0A%7D%0A'

#comment rajouter un head sur la requete get http
Species.new('http://example.com', headers: { 'User-Agent' => 'EndangeredSpeciesIdentifier/0.1 (contact@okfnfr; http://cites.okfn.fr/en/home/)' }).get


#User-Agent: EndangeredSpeciesIdentifier/0.1 (contact@okfnfr; http://cites.okfn.fr/en/home/)


species = JSON.parse(open(url).read)
species.each do |specie|
  Specie.create!(
    taxonRank: specie["taxonRank"],
    idCITES: specie["idCITES"],
    nomSC: specie["nomSC"],

    )
end
puts 'Species created!'

