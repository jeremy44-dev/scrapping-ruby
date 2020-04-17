exo1 : 
- tests OK
- get_cryptos OK

exo2 :
- tests OK
- get_townhall_email OK
- get_townhall_urls OK (attendre 100s pour récupérer les 178 emails des 185 villes)

exo3 : 
- test OK
- get_depute_hashs 90% OK mais toujours des bogues 
    des emails ont un format perso => l'extraction du prenom et du nom échoue, exemples :
    {"first_name"=>"Audeamadou", "last_name"=>"Audeamadou", "email"=>"permanence@audeamadou.fr"}
    {"first_name"=>"Julienaubert", "last_name"=>"Julienaubert", "email"=>"contact@julienaubert.fr"}
=> besoin de trouver un champ prénom et un champ nom séparés...
- beaucoup d'erreurs "500 Internal Server Error"
