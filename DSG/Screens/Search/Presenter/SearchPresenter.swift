//
//  SearchPresenter.swift
//  DSG
//
//  Created by Souvik Das on 06/06/21.
//

import Foundation
import Alamofire
import UIKit

protocol SearchPresenterDelegate : AnyObject{
    func presentAlert(title : String, message : String)
    func presentLoader(show : Bool)
    func populateEventDatas(eventResponse : EventsSearchResponse)
}
typealias EventSearchPresenterDelegate = SearchPresenterDelegate & UIViewController

class SearchPresenter {
    
    weak var delegate : EventSearchPresenterDelegate?
    
    public func setViewDelegate(delegate : EventSearchPresenterDelegate){
        self.delegate = delegate
    }
    
    //API Calls
    public func getEvents(searchQuery : String,page : Int){
        
        if APIClient.NetworkManager.sharedManager.isReachable{
        let params : [String:AnyObject] = ["client_id" : CLIENT_ID as AnyObject,"q":searchQuery as AnyObject,"page" : page as AnyObject]
        if page == 1{
            delegate?.presentLoader(show: true)
        }
        APIClient.sharedInstance.getRequestWithURL(parameters: params, url: ApiConstants.WebServicesApi.search) {[weak self] (response:NSDictionary?, error:NSError?,responseObject: AFDataResponse<Any>?) in
            if page == 1{
                self?.delegate?.presentLoader(show: false)
            }
            if ((error) != nil){
                print(error.debugDescription)
                self?.delegate?.presentAlert(title: Constants.DefaultMessages.error, message: response?.value(forKey: "message") as? String ?? "")
            }else{
                if responseObject?.response?.statusCode == API_REQUEST_SUCCESS {
                    self?.parseEventResponse(data: responseObject?.data)
                }else{
                    self?.delegate?.presentAlert(title: Constants.DefaultMessages.error, message: response?.value(forKey: "message") as? String ?? "")
                }
            }
        }
      }else{
            delegate?.presentAlert(title: Constants.DefaultMessages.error, message: Constants.DefaultMessages.noInternet)
      }
}
    
    
    public func parseEventResponse(data:Data?) {
        DispatchQueue.global(qos: .userInitiated).async {[weak self] in
            do {
                let decoder = JSONDecoder()
                let eventResponse = try decoder.decode(EventsSearchResponse.self, from: data!)
                self?.delegate?.populateEventDatas(eventResponse: eventResponse)
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
    
    
    //Navigation
    public func gotoEventDetailsScreen(event : EventsSearchEvent?,vc : UIViewController){
        let storyBoard = UIStoryboard(name: Constants.StoreboardIdentifers.main, bundle: nil)
        let eventDetailsVc = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifers.eventDetailsViewControllerIdentifer) as! EventDetailsViewController
        //pass data
        eventDetailsVc.eventDetails = event
        vc.navigationController?.pushViewController(eventDetailsVc, animated: true)
    }
  
}
