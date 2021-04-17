//
//  PokemonDetails.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import Foundation

struct PokemonDetails : Codable{
    var abilities : [Abilities]?
    var height : Int?
    var id : Int?
    var name : String?
    var stats : [Stats]?
    var weight : Int?
}

struct Abilities : Codable{
    var ability : Ability?
    var isHidden : Bool?
    var slot : Int?
}

struct Ability : Codable{
    var name : String?
    var url : String?
}

struct Stats : Codable{
    var base_stat : Int?
    var stat : Stat?
}

struct Stat : Codable{
    var name : String?
    var url : String?
}

/*
 
 JSON
 
 {
   "abilities": [
     {
       "ability": {
         "name": "limber",
         "url": "https://pokeapi.co/api/v2/ability/7/"
       },
       "is_hidden": false,
       "slot": 1
     },
     {
       "ability": {
         "name": "imposter",
         "url": "https://pokeapi.co/api/v2/ability/150/"
       },
       "is_hidden": true,
       "slot": 3
     }
   ],
   "height": 3,
   "id": 132,
   "name": "ditto",
   "sprites": {
     "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png",
     "back_female": null,
     "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png",
     "back_shiny_female": null,
     "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
     "front_female": null,
     "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png",
     "front_shiny_female": null,
     "other": {
       "dream_world": {
         "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg",
         "front_female": null
       },
       "official-artwork": {
         "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png"
       }
     },
   "stats": [
     {
       "base_stat": 48,
       "effort": 1,
       "stat": {
         "name": "hp",
         "url": "https://pokeapi.co/api/v2/stat/1/"
       }
     },
     {
       "base_stat": 48,
       "effort": 0,
       "stat": {
         "name": "attack",
         "url": "https://pokeapi.co/api/v2/stat/2/"
       }
     },
     {
       "base_stat": 48,
       "effort": 0,
       "stat": {
         "name": "defense",
         "url": "https://pokeapi.co/api/v2/stat/3/"
       }
     },
     {
       "base_stat": 48,
       "effort": 0,
       "stat": {
         "name": "special-attack",
         "url": "https://pokeapi.co/api/v2/stat/4/"
       }
     },
     {
       "base_stat": 48,
       "effort": 0,
       "stat": {
         "name": "special-defense",
         "url": "https://pokeapi.co/api/v2/stat/5/"
       }
     },
     {
       "base_stat": 48,
       "effort": 0,
       "stat": {
         "name": "speed",
         "url": "https://pokeapi.co/api/v2/stat/6/"
       }
     }
   ],
   "weight": 40
 }
 
 
 */
