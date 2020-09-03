//
//  ViewController.swift
//  diceRoll
//
//  Created by Bernice TSAI on 2020/9/1.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet var dices: [UIImageView]!
    let diceImageName = ["die.face.1.fill", "die.face.2.fill", "die.face.3.fill", "die.face.4.fill", "die.face.5.fill", "die.face.6.fill"]
    var chances: Int  = 3
    var winCount: Int = 0
    var lossCount: Int = 0
    var evenCount: Int = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        clearButton.isHidden = true
        countLabel.text = "第 \(4-chances) 局"
        // Do any additional setup after loading the view.
    }

    @IBAction func play(_ sender: UIButton) {
        if chances > 0 {chances -= 1
        countLabel.text = "第 \(3-chances) 局"
        prizeLabel.isHidden = true
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
            }}
            if leftSum > rightSum{
                
                winCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }else if leftSum < rightSum{
                lossCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }else{
                evenCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }
        DispatchQueue.main.asyncAfter (deadline: .now() + 1.2){
                if self.chances == 0{
                    self.playButton.isHidden = true
                    self.playButton.isEnabled = false
                    if self.winCount > self.lossCount+self.evenCount{
                for dice in self.dices{
                dice.image = UIImage(named: "ice")
                self.prizeLabel.isHidden = false
                self.prizeLabel.text = "You win an ice cream !"
                self.player1Label.text = ""
                self.player2Label.text = ""
                self.clearButton.isHidden = false
                }
                }else{
                    for dice in self.dices{dice.image = UIImage(named: "shit")
                self.prizeLabel.isHidden = false
                self.prizeLabel.text = "uh ... holy shit!"
                self.player1Label.text = ""
                self.player2Label.text = ""
                self.clearButton.isHidden = false
                    }
                }
            }
    }
    }
    }

    
    @IBAction func clearRecord(_ sender: Any) {
        chances  = 3
        winCount = 0
        lossCount = 0
        evenCount = 0
        playButton.isEnabled = true
        playButton.isHidden = false
        clearButton.isHidden = true
    }
}
