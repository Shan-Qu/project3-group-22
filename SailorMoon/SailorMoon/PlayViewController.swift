//
//  ViewController.swift
//  SailorMoon
//
//  Created by Mayumi on 2018/5/14.
//  Copyright © 2018年 Mayumi. All rights reserved.
// 最大高26个（水冰月23行），最大宽17 ///testingtesting

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet weak var drawingArea: UIView!
    @IBOutlet weak var colorBoard: UIView!
    @IBOutlet weak var matchButton: UIButton!
    
    @IBAction func matchPressed(_ sender: Any) {
        playerFinishedGame = playerResult
        currentPresets = presets
    }
    var singleLength: Int = 20
    var heightNum = 26
    var widthNum = 17 
    //var blocksArray: [UIButton] = [UIButton]()
    var presets: [Preset] = [Preset]()
    var playerResult: [Preset] = [Preset]()//玩家版
    
    var currentColor: UIColor? = nil
    var tappedColorNum: Int = 0
    
    //绘图模块，还需要把每个块连同坐标值放进数组（画板部分）
    func generateEmptyBoard(){
        var currentHeight = 0
        var currentWidth = 380
       // var x: Int = 0
       // var y: Int = 0
        var orderNumber: Int = 0
        for _ in 1...heightNum{
            //y += 1
            for _ in 1...widthNum{
                orderNumber += 1
                var newBlock: UIButton
                //x += 1
                newBlock = UIButton(frame: CGRect(x:currentWidth, y: currentHeight, width: singleLength, height: singleLength))
                newBlock.accessibilityLabel = String(orderNumber)
                if presets.count >= orderNumber{
                    if presets[orderNumber-1].colorNumber == 0 {//如果是灰色区域变透明
                        newBlock.backgroundColor = UIColor(red: 7/255, green: 255/255, blue: 255/255, alpha: 0)
                        newBlock.isEnabled = false //其他位置不能上色
                    }else{//否则是灰色
                        newBlock.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)
                    }
                }else{
                    newBlock.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0) //水冰月结束行一下也是透明
                    newBlock.isEnabled = false //其他位置不能上色
                }
                self.drawingArea.addSubview(newBlock)
                newBlock.addTarget(self,action:#selector(blockTapped(sender:)), for: UIControlEvents.touchUpInside)
                playerResult.append(Preset(orderNumber: orderNumber, colorNumber: 0))//预设每个颜色是灰色,(后面点过才会改colorNumber)
                currentWidth += singleLength + 1
            }
            currentWidth = 380
            currentHeight += singleLength + 1
        }
    }
    var test: Int = 0//用来test有颜色的button数量（最后可删掉）
    //preset board can not be changed.(color)水冰月完成图
    func generatePresetBoard(){
        var currentHeight = 0
        var currentWidth = 0
        //var x: Int = 0
        //var y: Int = 0
        var orderNumber: Int = 0
        for _ in 1...heightNum{
            //y += 1
            for _ in 1...widthNum{
                orderNumber += 1
                var newBlock: UIButton
                //x += 1
                newBlock = UIButton(frame: CGRect(x:currentWidth, y: currentHeight, width: singleLength, height: singleLength))
                if presets.count >= orderNumber{
                    if presets[orderNumber-1].colorNumber == 0 {
                        newBlock.backgroundColor = UIColor(red: 7/255, green: 255/255, blue: 255/255, alpha: 0)
                    }else{
                        test += 1
                        newBlock.backgroundColor = getColor(colorNumber: presets[orderNumber-1].colorNumber)
                    }
                }else{
//                    newBlock.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)     //灰色
                    newBlock.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0) //水冰月结束行一下也是透明
                }
                //var new = Blocks(x: x, y: y, eachBlock: newBlock)
                //blocksClassArray.append(new)//放进数组
                newBlock.isEnabled = false//全部不能上色
                self.drawingArea.addSubview(newBlock)
                newBlock.addTarget(self,action:#selector(blockTapped(sender:)), for: UIControlEvents.touchUpInside)
                currentWidth += singleLength + 1
            }
            currentWidth = 0
            currentHeight += singleLength + 1
            
        }
        print(test)//test有颜色的button数量
    }
    
    //写一个取色板模块，从AppData.swift取来设定好的button群
    func generateColorBoard(){
        let colorBlockLength = 30
        var currentHeight = 0
        var currentWidth = 0
        var orderNumber: Int = 0
        //var colorNumber: Int = 0
        for _ in 1...10{
            for _ in 1...2{
                orderNumber += 1
                var newColor: UIButton
                newColor = UIButton(frame: CGRect(x:currentWidth, y: currentHeight, width: colorBlockLength, height: colorBlockLength))
                //newColor.accessibilityLabel = String(orderNumber)
                //print(colorSet.count)
                if orderNumber <= colorSet1.count {
                    newColor.backgroundColor = colorSet1[orderNumber-1].color
                    newColor.accessibilityLabel = String(colorSet1[orderNumber-1].colorNum)
                }else{
                    newColor.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 0)//全透明（灰）
                    newColor.isEnabled = false
                }
                self.colorBoard.addSubview(newColor)
                newColor.addTarget(self,action:#selector(colorTapped(sender:)), for: UIControlEvents.touchUpInside)
                //newBlock.addTarget(self,action:#selector(afterTapBubble(sender:)), for: UIControlEvents.touchUpInside)
                currentWidth += colorBlockLength
            }
            currentWidth = 0
            currentHeight += colorBlockLength
        }
    }
    
    @objc func colorTapped(sender:UIButton?){
        //currentColor = sender?.backgroundColor
        tappedColorNum = Int((sender?.accessibilityLabel)!)!
    }
    
    @objc func blockTapped(sender:UIButton?){
//        if (currentColor != nil) {
//            for i in colorSet1{
//                if i.colorNum == tappedColorNum{
//                    sender?.backgroundColor = getColor(colorNumber: tappedColorNum)
//
//                }
//            }
        sender?.backgroundColor = getColor(colorNumber: tappedColorNum)
        for i in playerResult{
            if i.orderNumber == Int((sender?.accessibilityLabel)!)!{
                i.colorNumber = tappedColorNum
            }
        }
        self.drawingArea.addSubview(sender!)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presets = sailorMoonCode(colorCode: colorCodeNo1)//加载水冰月数据👌
        
        generatePresetBoard()
        generateEmptyBoard()
        generateColorBoard()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

