//
//  ContentView.swift
//  NotizenApp
//
//  Created by Julian on 20/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var notizen: [String] = []
    @State var notiz = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notizen, id: \.self) { notiz in
                            Text(notiz)
                    }
                    .onDelete(perform: { indexSet in
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                    })
                }
                .navigationTitle("Notizen")
                HStack {
                    TextField("Neue Notiz", text: $notiz)
                    Button("Hinzufügen") {
                        notizen.append(notiz)
                        notiz = ""
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
