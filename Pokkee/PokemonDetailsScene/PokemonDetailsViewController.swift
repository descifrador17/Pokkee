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
    
    var pokemonDetailsDataSource = PokemonDetailsDataSource()
    
    @IBOutlet weak var detailsTable: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var frontDefaultImageView: UIImageView!
    
    @IBOutlet weak var frontShinyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleVC
        
        fetchPokemonData()
        
        detailsTable.delegate = self
        
        detailsTable.dataSource = pokemonDetailsDataSource
        
        // Do any additional setup after loading the view.
        
    }
    
    private func fetchPokemonData(){
        NetworkingApi().getPokemonDetails(from: pokemonUrl, completionHandler: { [weak self] result in
            guard let strongSelf = self else {return}
            strongSelf.pokemonDetailsDataSource.pokemonDetails = result
            strongSelf.pokemonDetailsDataSource.loadSectionValues()
            strongSelf.detailsTable.reloadData()
            NetworkingApi().loadImage(from: result.sprites!.front_default!, completionHandler: {[weak self] fetchedImage in
                self?.frontDefaultImageView.image = fetchedImage
            })
            NetworkingApi().loadImage(from: result.sprites!.front_shiny!, completionHandler: {[weak self] fetchedImage in
                self?.frontShinyImageView.image = fetchedImage
            })
            strongSelf.activityIndicator.stopAnimating()
            strongSelf.detailsTable.isHidden = false
            print(result)
        })
    }

}


extension PokemonDetailsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
