//
//  PokemonDetailsDataSource.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 17/04/21.
//

import UIKit

class PokemonDetailsDataSource : NSObject, UITableViewDataSource{
    
    var pokemonDetails = PokemonDetails()
        
    var sectionHeader = ["Details", "Abilities", "Stats"]
    var sectionValues = [[""],[""],[""]]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionValues[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
        cell.textLabel?.text = sectionValues[indexPath.section][indexPath.row]
        return cell
    }
    
    //MARK: Helper Functions
    func loadSectionValues(){
        var abilitiesSectionValues = [String]()
        for ability in pokemonDetails.abilities!{
            abilitiesSectionValues.append((ability.ability?.name?.capitalized)!)
        }
        let detailsSectionValues = ["Height -> \((pokemonDetails.height)!)","Weight -> \((pokemonDetails.weight)!)"]
        var statsSectionValues = [String]()
        for stat in pokemonDetails.stats!{
            statsSectionValues.append("\((stat.stat?.name?.capitalized)!) -> \((stat.base_stat)!)")
        }
        
        sectionValues = [detailsSectionValues.map{"\($0)"},abilitiesSectionValues.map{"\($0)"},statsSectionValues.map{"\($0)"}]
        
    }
    
}
