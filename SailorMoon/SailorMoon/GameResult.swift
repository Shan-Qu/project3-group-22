//
//  GameResult.swift
//  SailorMoon
//
//  Created by Mayumi on 2018/5/27.
//  Copyright © 2018年 Mayumi. All rights reserved.
//

import Foundation
import UIKit

class GameResultViewController: UIViewController {
    
    @IBOutlet weak var gameResultLabel: UILabel!
    var matchResult:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        matchResult = match(preset: currentPresets, playerResult: playerFinishedGame)
        print(matchResult)//for test
        gameResultLabel.text = grade(matchNumber: matchResult, totalNumber: 250)//水冰月有250个
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var test2:Int = 0
    
    func match(preset:[Preset],playerResult:[Preset])->Int {
        var matchNumber: Int = 0
        for i in preset{
            for j in playerResult{
                if i.orderNumber == j.orderNumber{
                    if i.colorNumber == j.colorNumber && i.colorNumber != 0{
                        matchNumber += 1
                    }
                }
            }
        }
        return matchNumber
    }
    
    func grade(matchNumber:Int, totalNumber:Int) ->String{
        let grade:Float = Float((matchNumber*100) / (totalNumber))
        if grade == 100 {
            return "Masterpiece!!"
        }else if grade < 100 && grade >= 90{
            return "A!"
        }else if grade < 90 && grade >= 70{
            return "B"
        }else if grade < 70 && grade >= 60{
            return "C"
        }else if grade < 50{
            return "D"
        }
        return "Error"
    }
}
