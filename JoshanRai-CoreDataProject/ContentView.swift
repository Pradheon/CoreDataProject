//
//  ContentView.swift
//  JoshanRai-CoreDataProject
//
//  Created by Joshan Rai on 3/30/22.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    //   Conditional saving of NSManagedObjectContext
    @Environment(\.managedObjectContext) var moc
    
    //   Why does \.self work for ForEach?
    //let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
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
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
