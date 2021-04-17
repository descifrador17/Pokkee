//
//  HomeViewController.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pokemonsTable: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var pokemonListDataSource = PokemonListDataSource()
    
    private var pokemonList = PokemonList()
    
    private var selectedPokemon = ""
    
    private var loadingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        fetchPokemonsList()
        
    }
    
    //MARK: setup UI
    func setupUI(){
        title = "Pokkee"
        pokemonsTable.dataSource = pokemonListDataSource
        pokemonsTable.delegate = self
    }
    
    //MARK: fetch data
    func fetchPokemonsList(){
        NetworkingApi().getPokemonsList(completionHandler: { [weak self] result in
            guard let strongSelf = self else {return}
            strongSelf.pokemonList = result
            strongSelf.activityIndicator.stopAnimating()
            strongSelf.pokemonsTable.isHidden = false
            strongSelf.pokemonListDataSource.data = result.results
            strongSelf.pokemonsTable.reloadData()
        })
    }
    
    func fetchMorePokemons(){
        if pokemonList.next != nil{
            print(pokemonList.next!)
            NetworkingApi().getmorePokemons(from: pokemonList.next!, completionHandler: { [weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.pokemonList = result
                strongSelf.loadingMore = false
                strongSelf.pokemonListDataSource.data!.append(contentsOf: result.results ?? [])
                strongSelf.pokemonsTable.reloadData()
            })
        }
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonDetailsViewController{
            vc.titleVC = selectedPokemon.capitalized
            vc.pokemonUrl = "https://pokeapi.co/api/v2/pokemon/\(selectedPokemon.lowercased())"
        }
    }
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPokemon = (tableView.cellForRow(at: indexPath)?.textLabel!.text)!
        performSegue(withIdentifier: "pokemonDataSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height{
            if !loadingMore{
                loadingMore = true
                fetchMorePokemons()
            }
        }
    }
}
