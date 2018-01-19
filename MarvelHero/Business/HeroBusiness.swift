//
//  HeroBusiness.swift
//  MarvelHero
//
//  Created by Bruno Medeiros Rafael on 07/01/2018.
//  Copyright © 2018 Bruno Medeiros Rafael. All rights reserved.
//

import Foundation

struct HeroBusiness {
    let provider = HeroProvider()
    
    func getAllHero() {
        provider.getHeros { (result) in
            
        }
    }
}
