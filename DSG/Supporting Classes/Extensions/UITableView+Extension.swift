//
//  UITableView+Extension.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import UIKit


extension UITableView{
    func setEmptyViewWitText(title: String , message: String) {
            
            let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
          
            let messageLabel = UILabel()
            let messageRedLabel = UILabel()
            
         
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageRedLabel.translatesAutoresizingMaskIntoConstraints = false
        
            
            messageLabel.textColor = UIColor.black
            messageRedLabel.textColor = UIColor.red

            emptyView.addSubview(messageLabel)
            emptyView.addSubview(messageRedLabel)
            
            messageRedLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
            messageRedLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -70).isActive = true
            
            messageLabel.topAnchor.constraint(equalTo: messageRedLabel.bottomAnchor, constant: 10).isActive = true
            messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
       
            messageLabel.text = message
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            
            messageRedLabel.text = title
            messageRedLabel.numberOfLines = 0
            messageRedLabel.textAlignment = .center
            self.backgroundView = emptyView
          
        }
    
    func restore() {
        self.backgroundView = nil
    }
    
}

