//
//  ViewController.swift
//  Roshambo
//
//  Created by Robin Heathcote on 06/07/2018.
//  Copyright © 2018 Robin Heathcote. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var oponentChoice: String?
    var userChoice: String?
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var actionLabel: UILabel!
    @IBAction func rockButton(_ sender: Any) {
        userChoice = "rock"
        print(calculateVictor())
    }
    @IBAction func paperButton(_ sender: Any) {
        userChoice = "paper"
        print(calculateVictor())
    }
    @IBAction func scissorsButton(_ sender: Any) {
        userChoice = "scissors"
        print(calculateVictor())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oponentChoice = (generateOpponentChoice())
        print(oponentChoice)
        
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
    
    func calculateVictor() -> String {
        var result: String
        
        switch userChoice {
        case let val where val == oponentChoice:
            result = "draw"
        case let val where (val == "paper") && (oponentChoice == "rock"):
            result = "win"
        case let val where (val == "paper") && (oponentChoice == "scissors"):
            result = "lost"
        case let val where (val == "scissors") && (oponentChoice == "paper"):
            result = "win"
        case let val where (val == "scissors") && (oponentChoice == "rock"):
            result = "lost"
        case let val where (val == "rock") && (oponentChoice == "scissors"):
            result = "win"
        case let val where (val == "rock") && (oponentChoice == "paper"):
            result = "lost"
        default:
            result = "FAIL"
        }
        return result
    }
}

