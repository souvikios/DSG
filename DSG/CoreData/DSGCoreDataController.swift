//
//  DSGCoreDataController.swift
//  DSG
//
//  Created by Souvik Das on 07/06/21.
//

import Foundation
import CoreData

class DSGCoreDataController: NSObject {
    
    fileprivate let persistenceManager: PersistenceManager!
    fileprivate var mainContextInstance: NSManagedObjectContext!
    
    
    class  var sharedInstance: DSGCoreDataController {
        struct singleton {
            static let instance=DSGCoreDataController()
        }
        return singleton.instance
    }
    
    override init() {
        self.persistenceManager = PersistenceManager.sharedInstance
        self.mainContextInstance = persistenceManager.getMainContextInstance()
    }
    
    func markAsFavorite(event: EventsSearchEvent) {
        
        //Minion Context worker with Private Concurrency type.
        let minionManagedObjectContextWorker: NSManagedObjectContext =
            NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        minionManagedObjectContextWorker.parent = self.mainContextInstance
        
        let cart = NSEntityDescription.insertNewObject(forEntityName: Constants.EntityTypes.Favorites,into: minionManagedObjectContextWorker)
        
        cart.setValue(event.id, forKey: "eventId")
      
       self.persistenceManager.saveWorkerContext(minionManagedObjectContextWorker)
       self.persistenceManager.mergeWithMainContext()
       self.fetchFavorite()
    }
    
    func deleteFavorite(eventId:Int64){
        var fetchedResults: Array<Favorites> = Array<Favorites>()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.EntityTypes.Favorites)
        fetchRequest.predicate = NSPredicate(format: "eventId == %lld", eventId)
        //Execute Fetch request
        do {
            mainContextInstance.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            fetchedResults = try self.mainContextInstance.fetch(fetchRequest) as! [Favorites]
            if fetchedResults.count > 0 {
                self.mainContextInstance.delete(fetchedResults[0])
                self.persistenceManager.mergeWithMainContext()
                self.fetchFavorite()
            }
        } catch let fetchError as NSError {
            print("retrieveById error: \(fetchError.localizedDescription)")
            fetchedResults = Array<Favorites>()
        }
      
    }
    
    
    func fetchFavorite(){
           var fetchedResults: Array<Favorites> = Array<Favorites>()
           
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.EntityTypes.Favorites)
           //Execute Fetch request
           do {
               mainContextInstance.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
               fetchedResults = try self.mainContextInstance.fetch(fetchRequest) as! [Favorites]
                AppDelegate.favoriteEvents = []
                fetchedResults.forEach { (fav) in
                    AppDelegate.favoriteEvents.append(Int(fav.eventId))
                }
                
            
           } catch let fetchError as NSError {
                print("retrieveById error: \(fetchError.localizedDescription)")
               fetchedResults = Array<Favorites>()
           }
    }

}
