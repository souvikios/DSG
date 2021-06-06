//
//  ViewController.swift
//  DSG
//
//  Created by Souvik Das on 05/06/21.
//

import UIKit

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
        
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getEvents(searchQuery: "")
            
        
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
        self.eventResponse = eventResponse
        DispatchQueue.main.async {
            if self.tblSearchList.isHidden{
                self.tblSearchList.isHidden = false
            }
            self.tblSearchList.reloadData()
        }
    }
    
}


// MARK: Navigation

extension SearchViewController {
    
    //Go to event details screen
    private func gotoEventDetailsScreen(event : EventsSearchEvent?){
        let storyBoard = UIStoryboard(name: Constants.StoreboardIdentifers.main, bundle: nil)
        let eventDetailsVc = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifers.eventDetailsViewControllerIdentifer) as! EventDetailsViewController
        //pass data
        eventDetailsVc.eventDetails = event
        navigationController?.pushViewController(eventDetailsVc, animated: true)
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
            self?.presenter.getEvents(searchQuery: searchText)
        }
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
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
        gotoEventDetailsScreen(event: eventObj)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 99.0
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
