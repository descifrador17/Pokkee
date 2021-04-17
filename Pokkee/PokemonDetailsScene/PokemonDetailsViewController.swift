//
//  PokemonDetailsViewController.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 17/04/21.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var titleVC = ""
    var pokemonUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleVC
        
        fetchPokemonData()

        // Do any additional setup after loading the view.
    }
    
    private func fetchPokemonData(){
        NetworkingApi().getPokemonDetails(from: pokemonUrl, completionHandler: { [weak self] result in
            guard let strongSelf = self else {return}
            print(result)
        })
    }

}
