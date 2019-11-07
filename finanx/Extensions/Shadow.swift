//
//  Shadow.swift
//  finanx
//
//  Created by Rafael Villarreal on 11/6/19.
//  Copyright © 2019 Rafael Villarreal. All rights reserved.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor {
        get {
            guard let color = layer.borderColor else {
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
