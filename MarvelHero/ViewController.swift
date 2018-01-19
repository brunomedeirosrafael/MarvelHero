//
//  ViewController.swift
//  MarvelHero
//
//  Created by Bruno Medeiros Rafael on 07/01/2018.
//  Copyright © 2018 Bruno Medeiros Rafael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var heroProvider = HeroProvider()
        heroProvider.getHeros { (result) in
            do {
                var teste = try result()
                print(teste)
            }catch {
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

