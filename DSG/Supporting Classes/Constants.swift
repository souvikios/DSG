//
//  Constants.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation



class Constants{
    
    struct StoreboardIdentifers{
        static let main = "Main"
    }
    
    struct ViewControllerIdentifers{
        static let eventDetailsViewControllerIdentifer = "EventDetailsViewController"
    }
    
   struct cellIdentifiers {
        static let eventSearchTableViewCellIdentifier = "EventSearchTableViewCell"
   }

    struct DateFormats {
      static let dateWithFullTime = "EEEE, MMM d yyyy h:mm a"
      static let responseDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    struct DefaultMessages{
        static let error = "Error"
        static let noInternet = "No Internet Connection"
    }
    
    struct EntityTypes{
        static let Favorites = "Favorites"
    }
    
}


// MARK:REST API STATUS CODE
let API_REQUEST_SUCCESS                     : Int       = 200 // Ok
let API_SINGUP_SUCCESS                     : Int        = 201 // created
let API_DELETE_SUCCESS                     : Int        = 204 // no content
let API_NO_RECORD_FOUND                     : Int       = 404 //no record found
let API_NOT_MODIFIED                     : Int          = 304 //no record found
let API_INTERNAL_SERVER_ERROR               : Int       = 500 // Internal Server Error
let API_Unprocessable_Entity               : Int        = 422
let API_UNAUTHORIZED                       : Int        = 401 // Unauthorized
let API_NOT_FOUND                     : Int             = 400 // Unauthorized
let API_FORBIDDEN                     : Int             = 403 // Unauthorized


// MARK:IMPORTANT CREDENTIALS
let CLIENT_ID = "MjIxMjc5NzJ8MTYyMjg5NjQ1OC41MTg4NTcy"
