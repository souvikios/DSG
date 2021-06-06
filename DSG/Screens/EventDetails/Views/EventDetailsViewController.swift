//
//  EventDetailsViewController.swift
//  DSG
//
//  Created by Souvik Das on 05/06/21.
//

import UIKit

class EventDetailsViewController: UIViewController {
  
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblEventTime: UILabel!
    @IBOutlet weak var lblEventLocation: UILabel!
    var eventDetails : EventsSearchEvent?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //populateEventDetailsData
        populateEventDetailsData()
        
    }
    
    private func populateEventDetailsData(){
        eventImageView.downloadImage(url: eventDetails?.performers?.first?.image ?? "", placeHolder: nil)
        lblEventName.text = eventDetails?.title
        lblEventLocation.text = eventDetails?.venue?.displayLocation
        let dateFromStr = CommonFunctions.convertStringToDateFormat(dateString: eventDetails?.datetimeLocal ?? "", format: Constants.DateFormats.responseDateFormat)
        let strFromDate = CommonFunctions.convertDateToStringFormat(date: dateFromStr, format: Constants.DateFormats.dateWithFullTime)
        lblEventTime.text = strFromDate
        if AppDelegate.favoriteEvents.contains(eventDetails?.id ?? 0) {
            btnFavorite.isSelected = true
        }else{
            btnFavorite.isSelected = false
        }
       
    }
    

    @IBAction func btnFavoriteAction(_ sender: UIButton) {
        
        if !sender.isSelected{
            sender.isSelected = true
            DSGCoreDataController.sharedInstance.markAsFavorite(event: eventDetails!)
        }else{
            sender.isSelected = false
            DSGCoreDataController.sharedInstance.deleteFavorite(eventId: Int64(eventDetails?.id ?? 0))
        }
        btnFavorite.transform = CGAffineTransform(scaleX: 0, y: 0)

        UIView.animate(withDuration: 1.0,delay: 0.2,usingSpringWithDamping: 0.5,
        initialSpringVelocity: 10,options: .curveLinear,animations: {
                self.btnFavorite.transform = .identity
        },completion: nil)
    }
    
}
