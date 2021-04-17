//
//  PokemonListDataSource.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import UIKit

final class PokemonListDataSource : NSObject, UITableViewDataSource{
    
    var data : [PokemonList]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].results.name
        return cell
    }
    
    
}

