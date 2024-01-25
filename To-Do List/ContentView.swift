//
//  ContentView.swift
//  To-Do List
//
//  Created by Fabiola Rocha Marquez on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First Thing", "Second Thing", "Third Thing", "Fourth Thing", "Fifth Thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove { indices, newOffset in
                    things.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    things.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
