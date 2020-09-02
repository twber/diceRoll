//
//  ViewController.swift
//  diceRoll
//
//  Created by Bernice TSAI on 2020/9/1.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet var dices: [UIImageView]!
    let diceImageName = ["die.face.1.fill", "die.face.2.fill", "die.face.3.fill", "die.face.4.fill", "die.face.5.fill", "die.face.6.fill"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func play(_ sender: UIButton) {
        var num: Int = 0
        var sum: Int = 0
        var leftSum: Int = 0
        var rightSum: Int = 0
        var index: Int = 0
        for dice in dices{
            //print(index)
            let num = Int.random(in: 1...6)
            dice.image = UIImage(systemName:diceImageName[num-1])
            sum += num
            index=index+1
            if index%2 != 0 {
                // player1 owns left dices
                //print("oddnum: \(num)")
                leftSum += num
                //print("oddsum: \(leftSum)")
                //print(player1Score)
                player1Label.text = "\(leftSum)"
            }else{
                //player2 owns right dices
                //print("evennum: \(num)")
                rightSum += num
                //print("evensum: \(rightSum)")
                
                //print(player2Score)
                player2Label.text = "\(rightSum)"
        }
            DispatchQueue.main.asyncAfter (deadline: .now() + 0.8){
                if leftSum > rightSum{
                    for dice in self.dices{
                dice.image = UIImage(named: "ice")
                self.prizeLabel.text = "You win an ice cream !"
                }
            }else{
                dice.image = UIImage(named: "shit")
                self.prizeLabel.text = "uh ... holy shit!"
            }
    }
    
    }

}

}
