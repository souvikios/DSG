//
//  UIViewExtension.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import UIKit

extension UIView{
    func setShadowWithCornerRadius(_ cornerRadius: Float, _ shadowRadius: Float, _ shadowColor: UIColor) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height: 0)
    }
}
