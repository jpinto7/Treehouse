//
//  ViewController.swift
//  FunFacts
//
//  Created by Juan Pablo Pinto Santana on 8/19/16.
//  Copyright © 2016 Juan Pablo Pinto Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var funFactLabel: UILabel!
    
    @IBOutlet weak var funFactButton: UIButton!
    
    let factModel = FactModel()
    let colorModel = ColorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funFactLabel.text = factModel.getRandomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showFunFact() {
        let newColor = colorModel.getRandomColor()
        view.backgroundColor = newColor
        funFactButton.tintColor = newColor
        funFactLabel.text = factModel.getRandomFact()
    }
}