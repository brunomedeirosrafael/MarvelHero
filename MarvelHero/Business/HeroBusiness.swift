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
    
    func getAllHero() -> [Hero] {
        provider.getHeros { (result) in
            do {
                guard let heroesJson = try result() else {
                    throw TecnicalError.parserError
                }
                
                let data = try JSONSerialization.data(withJSONObject: heroesJson, options: .prettyPrinted)
                let decoder = JSONDecoder()
                let heroes: Hero = try decoder.decode(Hero.self, from: data)
                return heroes
            } catch {
                throw error
            }
        }
    }
}
