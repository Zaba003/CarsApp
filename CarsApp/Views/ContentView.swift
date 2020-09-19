//
//  ContentView.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 16.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Car.CarsFetchRequest()) var allCars: FetchedResults<Car>
    
    
    @State var selectedModal = 0
    @State var showSheetView = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ListCars(selectedModal: $selectedModal, showSheetView: $showSheetView)

                }
                
            }
            
            .navigationBarItems(trailing:
                                    Button(action: {
                                        selectedModal = 1
                                        showSheetView.toggle()
                                    }) {
                                        Text("Добавить")
                                    }
                .sheet(isPresented: $showSheetView, content: {
                    AddCarView(showSheetView: $showSheetView)
                        .environment(\.managedObjectContext, self.managedObjectContext)
                })
            )
            .navigationBarTitle("Автомобили")
        }
    }
}

