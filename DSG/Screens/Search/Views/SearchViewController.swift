//
//  ViewController.swift
//  DSG
//
//  Created by Souvik Das on 05/06/21.
//

import UIKit
import UIScrollView_InfiniteScroll

class SearchViewController: BaseViewController, SearchPresenterDelegate {
  
    
    private var eventResponse : EventsSearchResponse?
    @IBOutlet var eventSearchField: UISearchBar!
    @IBOutlet weak var tblSearchList: UITableView!
    private let presenter = SearchPresenter()
    private weak var timer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViews()
        setupInFiniteScrolling()
        
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getEvents(searchQuery: "", page: 1)
            
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if eventResponse != nil{
            DispatchQueue.main.async {
                self.tblSearchList.reloadData()
            }
        }
    }
    //load additional items
    private func initViews(){
        navigationItem.titleView = eventSearchField
        tblSearchList.register(UINib(nibName: Constants.cellIdentifiers.eventSearchTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifiers.eventSearchTableViewCellIdentifier)
    }
    
    // for paginaation
    private  func setupInFiniteScrolling() {
        tblSearchList.setShouldShowInfiniteScrollHandler { (tableView) -> Bool in
            if self.eventResponse?.events == nil{
                return false
            }else{
                if self.eventResponse?.events?.count ?? 0 <  self.eventResponse?.meta?.total ?? 0{
                    return true
                }else{
                    return false
                }
                
            }
        }
        
        tblSearchList.addInfiniteScroll {(tableView) in
            let pageTobeLoaded = ((self.eventResponse?.meta?.page ?? 1)+1)
            self.presenter.getEvents(searchQuery: self.eventSearchField.text ?? "", page: pageTobeLoaded)
        }
    }
    
    //Presenter Delegate Methods
    func presentAlert(title: String, message: String) {
        DispatchQueue.main.async {
            AlertUtility.showAlert(self, title: title, message: message)
        }
    }
    
    func presentLoader(show: Bool) {
        showLoader(show: show)
    }
    
    func populateEventDatas(eventResponse: EventsSearchResponse) {
        if eventResponse.meta?.page == 1{
            self.eventResponse = eventResponse
        }else{
            self.eventResponse?.events?.append(contentsOf: eventResponse.events!)
            self.eventResponse?.meta = eventResponse.meta
        }
        DispatchQueue.main.async {
            if self.tblSearchList.isHidden{
                self.tblSearchList.isHidden = false
            }
            if eventResponse.meta?.page == 1{
                self.tblSearchList.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            }
            self.tblSearchList.reloadData()
            self.tblSearchList.finishInfiniteScroll()
        }
    }
    
}




// MARK: SearchBar Delegate Methods

extension SearchViewController : UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        eventSearchField.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = .scheduledTimer(withTimeInterval: 0.7, repeats: false) { [weak self] timer in
            // trigger autocomplete
            self?.presenter.getEvents(searchQuery: searchText, page: 1)
        }
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        eventSearchField.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        eventSearchField.resignFirstResponder()
        eventSearchField.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        eventSearchField.resignFirstResponder()
        eventSearchField.showsCancelButton = false
    }
}

// MARK: TableView Datasource & Delegate Methods

extension SearchViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if eventResponse != nil && eventResponse?.events?.count ?? 0 > 0{
            tableView.restore()
            return eventResponse?.events?.count ?? 0
        } else{
            tableView.setEmptyViewWitText(title: "Oops!", message: "No Data Found.")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.eventSearchTableViewCellIdentifier) as! EventSearchTableViewCell
        let eventObj = self.eventResponse?.events?[indexPath.row]
        cell.setupCellData(model: eventObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventObj = self.eventResponse?.events?[indexPath.row]
        presenter.gotoEventDetailsScreen(event: eventObj,vc: self)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    
}
