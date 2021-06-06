//
//  ApiConstants.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation

class ApiConstants: NSObject {
  
  private struct ApiVersion {
    static let version = "2/"
  }
    
  enum BaseUrl : String {
    case local = "https://api.seatgeek.com/"
    
  }
    
    struct WebServicesApi {
      static let baseUrl = BaseUrl.local.rawValue + ApiConstants.ApiVersion.version
      static let search = baseUrl + "events"
    }
    
}
