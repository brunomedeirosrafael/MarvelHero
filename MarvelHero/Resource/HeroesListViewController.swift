//
//  HeroesListViewController.swift
//  MarvelHero
//
//  Created by Luiz Claudio Vasconcellos Oliveira on 19/01/18.
//  Copyright © 2018 Bruno Medeiros Rafael. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {

    lazy var business = HeroBusiness()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let heroes = business.getAllHero()
    }

   
    

}
