//
//  CoreDataManager.swift
//  ProfileMVP
//
//  Created by Siva Nagarajan on 19/08/25.
//

import CoreData
// MARK: - Singleton
class CoreDataManager {
    static let shared = CoreDataManager()
    
    private static let modelName = "ProfileMVP"
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: CoreDataManager.modelName)
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // MARK: - Core Data Saving support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("❌ Failed to save Core Data: \(error)")
            }
        }
    }
    
    func clear(entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("✅ Cleared all \(entityName) records")
        } catch {
            print("❌ Failed to clear Core Data: \(error)")
        }
    }
}
