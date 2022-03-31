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
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    @State private var dead = false
    
    var body: some View {
        //   Why does \.self work for ForEach?
        /*
        List {
            ForEach([2, 4, 6, 8, 10], id: \.self) {
                Text("\($0) is even")
            }
        }
         */
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
