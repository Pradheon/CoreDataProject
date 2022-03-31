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
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
