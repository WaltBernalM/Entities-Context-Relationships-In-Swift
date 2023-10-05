//
//  ContentView.swift
//  EntitiesContextRelationships
//
//  Created by Walter Bernal Montero on 05/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Button(action: {
            
        }, label: {Text("Core Button")})
        .padding(10)
        .background(Color.blue)
        .border(.gray)
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
