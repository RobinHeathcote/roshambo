//
//  ViewController.swift
//  Roshambo
//
//  Created by Robin Heathcote on 06/07/2018.
//  Copyright © 2018 Robin Heathcote. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(generateOpponentChoice())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateOpponentChoice() -> String {
        let randomValue = 1 + arc4random() % 6
        let choice: String
        
        switch randomValue {
        case 1, 2 :
            choice = "rock"
        case 3, 4:
            choice = "scissors"
        default:
            choice = "paper"
        }
        return choice
    }
}

