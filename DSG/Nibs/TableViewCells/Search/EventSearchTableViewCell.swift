//
//  EventSearchTableViewCell.swift
//  DSG
//
//  Created by Souvik Das on 05/06/21.
//

import UIKit

class EventSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var lblEventTime: UILabel!
    @IBOutlet weak var lblEventPlace: UILabel!
    @IBOutlet weak var lblEventName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwContainer.setShadowWithCornerRadius(5, 5, .darkGray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellData(model : EventsSearchEvent?){
        eventImageView.downloadImage(url: model?.performers?.first?.image ?? "", placeHolder: nil)
        lblEventName.text = model?.title
        lblEventPlace.text = model?.venue?.displayLocation
        let dateFromStr = CommonFunctions.convertStringToDateFormat(dateString: model?.datetimeLocal ?? "", format: Constants.DateFormats.responseDateFormat)
        let strFromDate = CommonFunctions.convertDateToStringFormat(date: dateFromStr, format: Constants.DateFormats.dateWithFullTime)
        lblEventTime.text = strFromDate
        if AppDelegate.favoriteEvents.contains(model?.id ?? 0) {
            favoriteImageView.image = UIImage(named: "heart-fill")
        }else{
            favoriteImageView.image = UIImage(named: "heart-line")
        }
        
    }
    
}


