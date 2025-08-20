//
//  ProfilePresenter.swift
//  ProfileMVP
//
//  Created by Siva Nagarajan on 18/08/25.
//

import Foundation
import CoreData

protocol ProfileView: AnyObject {
    func reloadProfiles()
    func showActionMessage(_ message: String)
}

final class ProfilePresenter {
    weak var view: ProfileView?
    private var profiles: [Profile] = []
    
    init(view: ProfileView) {
        self.view = view
    }

    // MARK: - Data Fetching
    func fetchProfiles() {
        let request: NSFetchRequest<Profile> = Profile.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        profiles = (try? CoreDataManager.shared.context.fetch(request)) ?? []
        view?.reloadProfiles()
    }
    
    // MARK: - Actions
    func updateLikeStatus(for index: Int, isLiked: Bool) {
        guard index >= 0 && index < profiles.count else { return }
        
        CoreDataManager.shared.context.performAndWait {
            profiles[index].isLiked = isLiked
            CoreDataManager.shared.saveContext()
        }
        
        let name = profiles[index].name ?? ""
        let message = isLiked ? "❤️ Liked \(name)" : "👎 Disliked \(name)"
        view?.showActionMessage(message)
        view?.reloadProfiles()
    }

    // MARK: - Helpers
    func numberOfProfiles() -> Int {
        return profiles.count
    }
    
    func profile(at index: Int) -> Profile? {
        guard index >= 0 && index < profiles.count else { return nil }
        return profiles[index]
    }
}
