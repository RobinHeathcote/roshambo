//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Robin Heathcote on 06/07/2018.
//  Copyright © 2018 Robin Heathcote. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var userChoice: String?
    var opponentChoice: String?
    var result: String?
    var matchScenario: Int?
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImage: UIImageView!
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = setResultText()
        self.resultImage.image = setResultImage()
        
            
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setResultText() -> String {
        var text: String
        
        switch result {
        case let result where result == "win":
            text = "YOUUUU WOOOOOONNNN"
        case let result where result == "lost":
            text = "You lost, loooser"
        case let result where result == "draw":
            text = "Meh, its a draw, boooring"
        default:
            text = ""
        }
        return text
    }
    
    func setResultImage() -> UIImage {
        var img: UIImage!
        switch matchScenario  {
        case let val where val == 1:
            img = UIImage(named: "itsATie")
        case let val where val == 2:
            img = UIImage(named: "PaperCoversRock")
        case let val where val == 3:
            img = UIImage(named: "ScissorsCutPaper")
        default:
            img = UIImage(named: "RockCrushesScissors")
        }
        return img!
    }
}
