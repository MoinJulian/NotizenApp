//
//  ContentView.swift
//  NotizenApp
//
//  Created by Julian on 20/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var notes: [String] = []
    @State var note: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(notes, id: \.self) {note in
                        Text(note)
                    }
                    .onDelete(perform: { indexSet in
                        notes.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Notes")
                HStack {
                    TextField("New note", text: $note)
                    Button("Add") {
                        notes.append(note)
                        note = ""
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
