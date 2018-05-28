//
//  AppData.swift
//  SailorMoon
//
//  Created by Mayumi on 2018/5/21.
//  Copyright © 2018年 Mayumi. All rights reserved.
//

import Foundation
import UIKit

let grey: UIColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)
let white: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
let greyBlock:UIButton = UIButton()

var playerFinishedGame: [Preset] = [Preset]()
var currentPresets: [Preset] = [Preset]()

var selectedSize: Int = 0 //给free style用的

var colorSet1: [ColorWithNum] = [ColorWithNum(colorNum: 0,color:UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)),ColorWithNum(colorNum:1 ,color:UIColor(red: 254/255, green: 229/255, blue: 12/255, alpha: 1.0)),ColorWithNum(colorNum: 2, color: UIColor(red: 233/255, green: 181/255, blue: 7/255, alpha: 1.0)),ColorWithNum(colorNum:3, color: UIColor(red: 6/255, green: 0/255, blue: 34/255, alpha: 1.0)),ColorWithNum(colorNum:4 ,color:UIColor(red: 42/255, green: 111/255, blue: 212/255, alpha: 1.0)),ColorWithNum(colorNum:5 ,color:UIColor(red: 255/255, green: 175/255, blue: 164/255, alpha: 1.0)),ColorWithNum(colorNum:6 ,color:UIColor(red: 250/255, green: 236/255, blue: 197/255, alpha: 1.0)),ColorWithNum(colorNum:7 ,color:UIColor(red: 234/255, green: 96/255, blue: 109/255, alpha: 1.0)),ColorWithNum(colorNum:8 ,color:UIColor(red: 234/255, green: 96/255, blue: 109/255, alpha: 1.0)),ColorWithNum(colorNum:9 ,color:UIColor(red: 79/255, green: 67/255, blue: 87/255, alpha: 1.0)),ColorWithNum(colorNum:10 ,color:UIColor(red: 251/255, green: 242/255, blue: 171/255, alpha: 1.0)),ColorWithNum(colorNum:11 ,color:UIColor(red: 234/255, green: 182/255, blue: 132/255, alpha: 1.0))]

class ColorWithNum{
    var colorNum: Int = 0
    var color: UIColor = UIColor()
    
    init(colorNum:Int, color: UIColor) {
        self.colorNum = colorNum
        self.color = color
    }
}

class Preset{
    var orderNumber: Int = 0
    var colorNumber: Int = 0
    
    init(orderNumber: Int, colorNumber: Int) {
        self.orderNumber = orderNumber
        self.colorNumber = colorNumber
    }
}

//水冰月的get color
func getColor(colorNumber: Int) -> UIColor {
    switch colorNumber {
    case 1:
        return UIColor(red: 254/255, green: 229/255, blue: 12/255, alpha: 1.0) //1黄
    case 2:
        return UIColor(red: 233/255, green: 181/255, blue: 7/255, alpha: 1.0)  //2浅棕
    case 3:
        return UIColor(red: 6/255, green: 0/255, blue: 34/255, alpha: 1.0)    //3黑色
    case 4:
        return UIColor(red: 42/255, green: 111/255, blue: 212/255, alpha: 1.0) //4深蓝
    case 5:
        return UIColor(red: 255/255, green: 175/255, blue: 164/255, alpha: 1.0)//5嘴
    case 6:
        return UIColor(red: 250/255, green: 236/255, blue: 197/255, alpha: 1.0)//6肉
    case 7:
        return UIColor(red: 234/255, green: 96/255, blue: 109/255, alpha: 1.0) //7红领巾
    case 8:
        return UIColor(red: 251/255, green: 253/255, blue: 252/255, alpha: 1.0)//8白
    case 9:
        return UIColor(red: 79/255, green: 67/255, blue: 87/255, alpha: 1.0)   //9鞋子
    case 10:
        return UIColor(red: 251/255, green: 242/255, blue: 171/255, alpha: 1.0)//10浅黄
    case 11:
        return UIColor(red: 234/255, green: 182/255, blue: 132/255, alpha: 1.0)//11卡其
    case 0:
        return UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)//0默认灰
    default:
        return UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)//默认灰
    }
}

var colorCodeNo1:[[Int]] = [[0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0],
                         [0,0,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0],
                         [0,0,1,1,2,1,1,1,1,1,1,1,2,1,1,0,0],
                         [0,0,0,2,1,1,1,1,1,1,1,1,1,2,0,0,0],
                         [0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0],//5
                         [0,0,1,10,1,10,10,1,1,1,1,1,10,10,1,0,0],
                         [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
                         [0,1,1,1,1,1,1,11,1,11,1,1,1,1,1,1,0],
                         [0,0,2,1,1,1,11,1,11,1,11,1,11,1,2,0,0],
                         [0,2,2,11,6,3,3,6,6,6,3,3,6,11,2,2,0],//10
                         [0,2,2,11,6,4,4,6,6,6,4,4,6,11,2,2,0],
                         [0,1,2,0,6,6,6,6,5,6,6,6,6,0,2,1,1],
                         [1,1,2,0,0,6,6,6,5,6,6,6,0,0,2,1,1],
                         [1,1,2,0,0,0,4,4,2,4,4,0,0,0,2,1,1],
                         [1,1,0,0,0,8,8,7,1,7,8,8,0,0,0,1,1],//15
                         [1,1,0,0,8,8,8,7,8,7,8,8,8,0,0,1,1],
                         [1,1,0,5,4,0,8,8,8,8,8,0,4,5,0,1,1],
                         [1,1,1,0,0,0,4,4,4,4,4,0,0,0,1,1,1],
                         [0,1,1,0,0,0,4,4,4,4,4,0,0,0,1,1,0],
                         [0,0,1,1,0,0,0,5,0,5,0,0,0,1,1,0,0],//20
                         [0,0,1,1,0,0,0,5,0,5,0,0,0,1,1,0,0],
                         [0,0,0,1,1,0,0,6,0,6,0,0,1,1,0,0,0],
                         [0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0]]//23

func sailorMoonCode(colorCode:[[Int]])-> [Preset]{
    var presetArray:[Preset] = [Preset]()
    
    for i in 0...colorCode.count-1{
        for j in 0...colorCode[i].count-1{
            let preset = Preset(orderNumber:i*17+j+1,colorNumber:colorCode[i][j])
            presetArray.append(preset)
        }
    }
    return presetArray
}

var FreeStylecolorSet: [UIColor] = [UIColor(red: 254/255, green: 229/255, blue: 12/255, alpha: 1.0), //1黄
                           UIColor(red: 233/255, green: 181/255, blue: 7/255, alpha: 1.0),  //2浅棕
                           UIColor(red: 6/255, green: 0/255, blue: 34/255, alpha: 1.0),     //3黑色
                           UIColor(red: 42/255, green: 111/255, blue: 212/255, alpha: 1.0), //4深蓝
                           UIColor(red: 255/255, green: 175/255, blue: 164/255, alpha: 1.0),//5嘴
                           UIColor(red: 250/255, green: 236/255, blue: 197/255, alpha: 1.0),//6肉
                           UIColor(red: 234/255, green: 96/255, blue: 109/255, alpha: 1.0), //7红领巾
                           UIColor(red: 234/255, green: 96/255, blue: 109/255, alpha: 1.0),//8白
                           UIColor(red: 79/255, green: 67/255, blue: 87/255, alpha: 1.0),   //9鞋子
                           UIColor(red: 251/255, green: 242/255, blue: 171/255, alpha: 1.0),//10浅黄
                           UIColor(red: 234/255, green: 182/255, blue: 132/255, alpha: 1.0),//11卡其
                           UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)]//0默认灰



