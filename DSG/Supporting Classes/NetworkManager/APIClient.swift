//
//  APIClient.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import Alamofire

typealias ServiceResponse = (NSDictionary?, NSError?, AFDataResponse<Any>?) -> Void

class APIClient: NSObject {
   
    class  var sharedInstance: APIClient {
        struct singleton {
            static let instance=APIClient()
        }
        return singleton.instance
    }
    
    internal class NetworkManager{
        static var sharedManager:NetworkReachabilityManager={
            let manager = NetworkReachabilityManager()
            return manager!
        }()
    }
    
    //MARK: Network Request
    
    func getRequestWithURL(parameters : [String : AnyObject], url : String, onCompletion :@escaping ServiceResponse ) {
       
        print("URL:\(url)")
        print("PARAMS:\(parameters)")
        AF.request(url,method: .get,parameters: parameters,encoding: URLEncoding(destination: .queryString)).responseJSON { responseObject in switch responseObject.result {
            case .success(let jsonObject):
                onCompletion(jsonObject as? NSDictionary, nil,responseObject)
                break
            case .failure(let error):
                onCompletion(nil, error as NSError,responseObject)
                break
                }
        }
    }
}

