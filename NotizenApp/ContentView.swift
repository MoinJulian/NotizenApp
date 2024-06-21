//
//  ContentView.swift
//  NotizenApp
//
//  Created by Julian on 20/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.inhalt)
    ]) var notizen: FetchedResults<Notiz>
    @State var notiz = ""
    
    init(filter: String) {
        if !filter.isEmpty {
            _notizen = FetchRequest(sortDescriptors: [], predicate:
                NSPredicate(format: "inhalt BEGINSWITH %@", filter))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notizen) { notiz in
                        NavigationLink(destination: NotizDetail(notiz: notiz)) {
                            Text(notiz.inhalt ?? "Error")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for i in indexSet {
                            let notiz = notizen[i]
                            moc.delete(notiz)
                        }
                        
                        try? moc.save()
                    })
                }
                .navigationTitle("Notizen")
                HStack {
                    TextField("Neue Notiz", text: $notiz)
                    Button("Hinzufügen") {
                        let neueNotiz = Notiz(context: moc)
                        neueNotiz.id = UUID()
                        neueNotiz.inhalt = notiz
                        
                        try? moc.save()
                        
                        notiz = ""
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct NotizDetail: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var notiz: Notiz
    @State private var inhalt = ""
    
    var body: some View {
        TextField("Notiz hier eingeben", text: $inhalt)
            .padding(.horizontal)
            .onAppear(perform: {
                inhalt = notiz.inhalt ?? ""
                
                let event = Event(context: moc)
                event.id = UUID()
                event.bezeichnung = "Geöffnet"
                event.datum = Date()
                
                notiz.addToEvents(event)
                
                try? moc.save()
            })
            .onDisappear(perform: {
                let event = Event(context: moc)
                event.id = UUID()
                event.bezeichnung = "Geschlossen"
                event.datum = Date()
                
                notiz.addToEvents(event)
                
                try? moc.save()
            })
            .onChange(of: inhalt, {
                notiz.inhalt = inhalt
            })
        List(notiz.getEvents) { event in
            HStack {
                Text(event.bezeichnung ?? "")
                Spacer()
                if let datum = event.datum {
                    Text("\(datum)")
                }
            }
        }
    }
}

#Preview {
    ContentView(filter: "A")
        .environment(\.managedObjectContext, DataController(name: "Model").container.viewContext)
}
