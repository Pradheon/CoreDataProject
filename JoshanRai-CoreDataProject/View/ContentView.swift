//
//  ContentView.swift
//  JoshanRai-CoreDataProject
//
//  Created by Joshan Rai on 3/30/22.
//

import SwiftUI
import CoreData

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    //   Why does \.self work for ForEach?
    //let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    //   Conditional saving of NSManagedObjectContext
    //@Environment(\.managedObjectContext) var moc
    
    //   Ensuring Core Data objects are unique using constraints
    /*
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
     */
    
    //   Filtering @FetchRequest using NSPredicate
    /*
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
     */
    /// For example, we could ask for ships that are from Star Wars, like this:
    ///     `NSPredicate(format: "universe == 'Star Wars'")`
    ///
    /// That gets complicated if your data includes quote marks, so it’s more common to use special syntax instead: `%@`means “insert some data here”, and allows us to provide that data as a parameter to the predicate rather than inline.
    ///     `NSPredicate(format: "universe == %@", "Star Wars")`
    ///
    /// As well as `==`, we can also use comparisons such as `<` and `>` to filter our objects. For example this will return Defiant, Enterprise, and Executor:
    ///     `NSPredicate(format: "name < %@", "F")`
    ///
    /// `%@` is doing a lot of work behind the scenes, particularly when it comes to converting native Swift types to their Core Data equivalents. For example, we could use an `IN` predicate to check whether the universe is one of three options from an array, like this:
    ///     `NSPredicate(format: "universe IN %@", ["Aliens", "Firely", "Star Trek"])`
    ///
    /// We can also use predicates to examine part of a string, using operators such as `BEGINSWITH` and `CONTAINS`. For example, this will return all ships that start with a capital E:
    ///      `NSPredicate(format: "name BEGINSWITH %@", "E")`
    ///
    /// That predicate is case-sensitive; if you want to ignore case you need to modify it to this:
    ///      `NSPredicate(format: "name BEGINSWITH[c] %@", "e")`
    ///
    /// `CONTAINS[c]` works similarly, except rather than starting with your substring it can be anywhere inside the attribute.
    /// Finally, you can flip predicates around using `NOT`, to get the inverse of their regular behavior. For example, this finds all ships that don’t start with an E:
    ///     `NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")`
    ///
    /// If you need more complicated predicates, join them using AND to build up as much precision as you need, or add an import for Core Data and take a look at NSCompoundPredicate – it lets you build one predicate out of several smaller ones.
    ///
    /// Attribution: https://www.hackingwithswift.com/books/ios-swiftui/filtering-fetchrequest-using-nspredicate
    ///
    
    //   Dynamically filtering @FetchRequest with SwiftUI
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        //   Why does \.self work for ForEach?
        /*
        List {
            ForEach([2, 4, 6, 8, 10], id: \.self) {
                Text("\($0) is even")
            }
        }
        
        List(students, id: \.self) { student in
            Text(student.name)
        }
         */
        
        //   Conditional saving of NSManagedObjectContext
        /*
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
         */
        
        //   Ensuring Core Data objects are unique using constraints
        /*
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        */
        
        //   Filtering @FetchRequest using NSPredicate
        /*
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown Name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
         */
        
        //   Dynamically filtering @FetchRequest with SwiftUI
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
