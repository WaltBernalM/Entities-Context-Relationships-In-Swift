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
            let newDish = Dish(context: viewContext)
            newDish.name = "Chicken Burger"
            newDish.price = 4.99
            newDish.size = "Large"
            
            let newDessert = Dessert(context: viewContext)
            newDessert.name = "Apple Pie"
            newDessert.price = 3.59
            newDessert.size = "Small"
            
            let location1 = Location(context: viewContext)
            location1.city = "Las Vegas"
            location1.neighborhood = "Downtown"
            location1.phoneNumber = "1234"
            
            let location2 = Location(context: viewContext)
            location2.city = "Los Angeles"
            location2.neighborhood = "North Hollywood"
            location2.phoneNumber = "5678"
            
            newDish.fromLocation = [location1, location2]
            newDessert.fromLocation = [location1]
            
            let customer = Customer(context: viewContext)
            customer.firstName = "John"
            customer.lastName = "Doe"
            customer.email = "j_doe@mail.com"
            customer.phoneNumber = "90123"
            
            customer.fromLocation = [location2]
            customer.toDish = newDish
            customer.toDessert = newDessert
            
            // Forced context to persist to Disk like Core Data
            guard viewContext.hasChanges else { return }
            do {
                try viewContext.save()
            } catch (let error ){
                print(error.localizedDescription)
            }
        }, label: {Text("Run Core Data")})
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
