//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by 홍창남 on 2017. 1. 27..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var currentEvoLabel: UIImageView!
    @IBOutlet weak var nextEvoLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoLabel.image = img
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
//            네트워크 콜이 끝난 후에 됨행됨
            self.updateUI()
        }
        
    }

    func updateUI(){
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "진화 불가능"
            nextEvoLabel.isHidden = true
        } else {
            nextEvoLabel.isHidden = false
            nextEvoLabel.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "다음 진화: \(pokemon.nextEvolutionName) - LVL: \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
