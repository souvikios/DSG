//
//  BaseViewController.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    
    let activityIndicator = UIActivityIndicatorView()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoader()
    }
    
    private func initLoader(){
        activityIndicator.sizeToFit()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    func showLoader(show : Bool){

        if show{
            if !activityIndicator.isAnimating{
                self.view.isUserInteractionEnabled = false
                activityIndicator.startAnimating()
            }
        }else{
            if activityIndicator.isAnimating{
                self.view.isUserInteractionEnabled = true
                activityIndicator.stopAnimating()
            }
        }
    }
    
    
}
