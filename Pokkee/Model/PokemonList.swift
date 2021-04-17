//
//  PokemonList.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import Foundation

struct PokemonList : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [Pokemons]?
}

struct Pokemons : Codable{
    var name : String?
    var url : String?
}


/*
 
 JSON FORMAT
 
 {
   "count": 1118,
   "next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
   "previous": null,
   "results": [
     {
       "name": "bulbasaur",
       "url": "https://pokeapi.co/api/v2/pokemon/1/"
     },
 .................
   ]
 }
 
 */
