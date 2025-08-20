//
//  ProfileSeeder.swift
//  ProfileMVP
//
//  Created by Siva Nagarajan on 19/08/25.
//

import Foundation
import CoreData

struct ProfileSeeder {
    
    static func preloadProfiles(context: NSManagedObjectContext, forced: Bool = false) {
        let request: NSFetchRequest<Profile> = Profile.fetchRequest()
        
        do {
            let count = try context.count(for: request)
            if forced {
                CoreDataManager.shared.clear(entityName: Profile.entity().name ?? "Profile")
            } else if count > 0 {
                return // already seeded
            }
        } catch {
            print("❌ Error checking Core Data: \(error)")
            return
        }
        
        for data in ProfileMockData.profiles {
            let profile = Profile(context: context)
            profile.id       = data.id
            profile.name     = data.name
            profile.imageName = data.imageName
            profile.sex      = data.sex
            profile.height   = data.height
            profile.weight   = data.weight
            profile.age      = data.age
            profile.info     = data.info
            profile.isLiked  = data.isLiked
        }
        
        do {
            try context.save()
            print("✅ Seeded profiles successfully")
        } catch {
            print("❌ Failed to seed profiles: \(error)")
        }
    }
}

enum ProfileMockData {
    static let profiles: [(id: Int64, name: String, imageName: String,
                           sex: String, height: String, weight: String,
                           age: String, info: String, isLiked: Bool)] = [
        (1, "Dr. Aisha Patel – Clinical Nutritionist", "aisha", "Female",
         "165 cm", "55 kg", "28 yrs",
         "Specialist in weight management and diabetes care. Believes in food as medicine.", false),
        (2, "John Miller – Sports Nutritionist", "john", "Male",
         "175 cm", "70 kg", "32 yrs",
         "Works with athletes for performance diets. Focused on protein balance and recovery meals.", false),
        (3, "Dr. Chen Wei – Pediatric Nutritionist", "chen", "Male",
         "180 cm", "78 kg", "30 yrs",
         "Combines nutrition with mindfulness. Loves plant-based diets and natural healing.", false),
        (4, "Lilly Stew – HITT traning & Speed", "lilly", "Female",
         "160 cm", "68 kg", "30 yrs",
         "Extensive knowledge of performance optimisation and movement excellence helps clients push boundaries and unlock their full potential.", false),
        (5, "Anna Williams – HITT traning & Speed", "anna", "Female",
         "160 cm", "68 kg", "30 yrs",
         "Discover your nutritional needs with our in-house expert, Radovan Ivanovic. Evaluate your needs, understand your health, and create a tailored plan that aligns with your goals..", false)
    ]
}

