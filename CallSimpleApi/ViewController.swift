//
//  ViewController.swift
//  CallSimpleApi
//
//  Created by Josue J Maqueda Flores on 6/1/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var pokemonList:[Pokemon] = [Pokemon]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        //
        self.getPokemonList()
    }

    private func getPokemonList()
    {
        AsyncClient.getRequestExecute(url: BackendUrlManager.shared.getUrl(.pokemonList), completion: { (responseObject:PokemonObject) in

            if let response = responseObject.results
            {
                self.pokemonList = response
                //
                if let urlPoke = self.pokemonList[0].url
                {
                    let splitUrl = urlPoke.split(separator: "/")
                    //
                    let idPokemon = splitUrl.last
                    let urlForm = BackendUrlManager.shared.getUrl(.pokemonForm) + "\(String(describing: idPokemon!))"

                    AsyncClient.getRequestExecute(url: urlForm, completion: { (responseObject:PokemonForm) in
                        //
                        print("Respuesta del Pokemon Form")
                        print("\(responseObject.is_mega)")
                        print("\(responseObject.name)")
                        print("\(responseObject.order)")
                        //
                    }, errorCompletion: { (error:String) in
                        print("Error: \(error)")
                    })
                }
            }
            
        }) { (error:String) in
            print("Error: \(error)")
        }
    }
}

