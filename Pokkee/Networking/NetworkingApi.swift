//
//  NetworkingApi.swift
//  Pokkee
//
//  Created by Dayal, Utkarsh on 17/04/21.
//

import Foundation

protocol NetworkingService  {
    @discardableResult func getPokemonsList(completionHandler : @escaping (PokemonList) -> ()) -> URLSessionDataTask
    
    @discardableResult func getPokemonDetails(from url : String, completionHandler : @escaping (PokemonDetails)->()) -> URLSessionDataTask

    @discardableResult func getmorePokemons(from url : String, completionHandler : @escaping (PokemonList) -> ()) -> URLSessionDataTask
}

final class NetworkingApi : NetworkingService{

    let session = URLSession.shared
    
    @discardableResult
    func getPokemonsList(completionHandler: @escaping (PokemonList) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error{
                    print("Error getting data \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse , (200...299).contains(httpResponse.statusCode) else{
                    print("Unfavourable Response")
                    return
                }
                
                guard let data = data ,
                      let result = try? JSONDecoder().decode(PokemonList.self, from: data) else{
                    print("Error parsing JSON")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    func getPokemonDetails(from url : String, completionHandler: @escaping (PokemonDetails) -> ()) -> URLSessionDataTask {
        
        let request = URLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: request){ data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error getting data \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse , (200...299).contains(httpResponse.statusCode) else{
                    print("Unfavourable Response")
                    return
                }
                
                guard let data = data,
                      let result = try? JSONDecoder().decode(PokemonDetails.self, from: data) else{
                    print("Error parsing JSON")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    func getmorePokemons(from url : String, completionHandler : @escaping (PokemonList) -> ()) -> URLSessionDataTask{
        let request = URLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: request){data, response, error in
            DispatchQueue.main.async {
                if let error = error{
                    print("Error getting data \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                    print("Unfavourable Response")
                    return
                }
                
                guard let data = data,
                      let result = try?  JSONDecoder().decode(PokemonList.self, from: data) else{
                    print("Error parsing JSON")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
}
