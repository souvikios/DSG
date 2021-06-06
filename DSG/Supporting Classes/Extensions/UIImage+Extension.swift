//
//  UIImage+Extension.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
 func downloadImage(url : String, placeHolder : UIImage?){
    let imageUrl = URL(string:url)
    self.kf.setImage(with: imageUrl! as URL, placeholder: placeHolder, options: [.fromMemoryCacheOrRefresh], progressBlock: nil, completionHandler: nil)
 }
}
