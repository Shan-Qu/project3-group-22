//
//  FreeStyle.swift
//  SailorMoon
//
//  Created by Mayumi on 2018/5/27.
//  Copyright © 2018年 Mayumi. All rights reserved.
//

import Foundation
import UIKit

class FreeStyleViewController : UIViewController {

    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var colorBoard: UIView!
    
    var currentColor: UIColor = UIColor()
    var singleLength: Int = 20
    var heightNum = 18
    var widthNum = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSize(selectedSize: selectedSize)
        // Do any additional setup after loading the view, typically from a nib.
        generateCanvas()
        generateColorBoard()
    }
    
    func updateSize(selectedSize:Int){
        heightNum = selectedSize
        widthNum = selectedSize
    }
    //生成画布
    func generateCanvas(){
        var currentHeight = 0
        var currentWidth = 0
        //var orderNumber: Int = 0
        for _ in 1...heightNum{
            for _ in 1...widthNum{
                //orderNumber += 1
                let newBlock = UIButton(frame: CGRect(x:currentWidth, y: currentHeight, width: singleLength, height: singleLength))
                newBlock.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)
                self.canvas.addSubview(newBlock)
                newBlock.addTarget(self,action:#selector(blockTapped(sender:)), for: UIControlEvents.touchUpInside)
                currentWidth += singleLength + 1
            }
            currentWidth = 0
            currentHeight += singleLength + 1
        }
    }
    //生成取色板
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
                if orderNumber <= FreeStylecolorSet.count {
                    newColor.backgroundColor = FreeStylecolorSet[orderNumber-1]
                    //newColor.accessibilityLabel = String(colorSet1[orderNumber-1].colorNum)
                }else{
                    newColor.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 0)//全透明（灰）
                    newColor.isEnabled = false
                }
                self.colorBoard.addSubview(newColor)
                newColor.addTarget(self,action:#selector(colorTapped(sender:)), for:
                    UIControlEvents.touchUpInside)
                currentWidth += colorBlockLength
            }
            currentWidth = 0
            currentHeight += colorBlockLength
        }
    }
    
    
    
    @objc func colorTapped(sender:UIButton?){
        currentColor = (sender?.backgroundColor)!
    }
    
    @objc func blockTapped(sender:UIButton?){
        sender?.backgroundColor = currentColor
        self.canvas.addSubview(sender!)
    }
    
    
    
}


