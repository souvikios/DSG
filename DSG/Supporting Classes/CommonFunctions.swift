//
//  CommonFunctions.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation



class CommonFunctions{
    
    static func convertStringToDateFormat(dateString: String, format: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from:dateString)
        return date!
    }
    
    static func convertDateToStringFormat(date: Date, format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from:date)
        return dateString
    }
    
}
