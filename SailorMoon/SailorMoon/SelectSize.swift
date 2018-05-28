//
//  selectSize.swift
//  SailorMoon
//
//  Created by Mayumi on 2018/5/27.
//  Copyright © 2018年 Mayumi. All rights reserved.
//

import Foundation
import UIKit

class SelectSizeViewController : UIViewController {
    
    @IBAction func size18Pressed(_ sender: Any) {
        selectedSize = 18
        performSegue(withIdentifier: "afterSelectSize", sender: nil)
    }

    @IBAction func size23Pressed(_ sender: Any) {
        selectedSize = 23
        performSegue(withIdentifier: "afterSelectSize", sender: nil)
    }
    
    @IBAction func size30Pressed(_ sender: Any) {
        selectedSize = 30
        performSegue(withIdentifier: "afterSelectSize", sender: nil)
    }
    
}
