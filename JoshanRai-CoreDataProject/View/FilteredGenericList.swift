//
//  FilteredGenericList.swift
//  JoshanRai-CoreDataProject
//
//  Created by Joshan Rai on 4/1/22.
//

import SwiftUI
import CoreData

enum Predicates: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case beginsWithIgnoreCase = "BEGINSWITH[c]"
    case containsIgnoreCase = "CONTAINS[c]"
}

struct FilteredGenericList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var entities: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    
    var content: (T) -> Content
    
    var body: some View {
        List(entities, id: \.self) { entity in
            self.content(entity)
        }
    }
    
    init(predicate: Predicates = .beginsWith, filterValue: String, filterKey: String, sortDescriptors: [NSSortDescriptor] = [], @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
