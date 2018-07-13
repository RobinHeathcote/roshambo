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
    var matchScenario: Int?
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var actionLabel: UILabel!
    @IBAction func rockButton(_ sender: Any) {
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        userChoice = "rock"
        
        controller.userChoice = userChoice
        controller.opponentChoice = oponentChoice
        controller.result = calculateVictor()
        controller.matchScenario = matchScenario!
        present(controller, animated: true, completion: nil)
    }
    @IBAction func paperButton(_ sender: Any) {
        userChoice = "paper"
        performSegue(withIdentifier: "playGame", sender: self)
    }
    @IBAction func scissorsButton(_ sender: Any) {
        userChoice = "scissors"
        performSegue(withIdentifier: "playGame", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oponentChoice = (generateOpponentChoice())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        
        controller.userChoice = userChoice
        controller.opponentChoice = oponentChoice
        controller.result = calculateVictor()
         controller.matchScenario = matchScenario!
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
            matchScenario = 1
        case let val where (val == "paper") && (oponentChoice == "rock"):
            result = "win"
            matchScenario = 2
        case let val where (val == "paper") && (oponentChoice == "scissors"):
            result = "lost"
            matchScenario = 3
        case let val where (val == "scissors") && (oponentChoice == "paper"):
            result = "win"
            matchScenario = 3
        case let val where (val == "scissors") && (oponentChoice == "rock"):
            result = "lost"
            matchScenario = 4
        case let val where (val == "rock") && (oponentChoice == "scissors"):
            result = "win"
            matchScenario = 4
        case let val where (val == "rock") && (oponentChoice == "paper"):
            result = "lost"
            matchScenario = 2
        default:
            result = "FAIL"
        }
        return result
    }
}

