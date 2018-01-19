//
//  HerosProviderTests.swift
//  MarvelHeroTests
//
//  Created by Bruno Medeiros Rafael on 07/01/2018.
//  Copyright © 2018 Bruno Medeiros Rafael. All rights reserved.
//

import XCTest
@testable import MarvelHero

class HerosProviderTests: XCTestCase {
    
    var heroProvider = HeroProvider()
    
    func testBaseUrl() {
        heroProvider.getHeros { (result) in
            do {
                let heros = try result()
                XCTAssert(true, "Não deu certo")
            } catch {
                XCTFail("erro na requisição")
            }
        }
    }
}
