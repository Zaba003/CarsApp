//
//  CarDetail.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 18.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct CarDetail: View {
    @FetchRequest(fetchRequest: Car.SelectedCarFetchRequest()) var selectedCar: FetchedResults<Car>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var showSheetView: Bool
    
    @State private var modelName: String = ""
    @State private var manufacturer: String = ""
    @State private var bodyType: String = ""
    @State private var transmission: String = ""
    @State private var year = ""
    @State private var type = ""
    
    
    let bodyTypes = ["Седан", "Купе", "Джип", "Пикап", "Минивэн", "Микроавтобус", "Хетчбек", "Лифтбек", "Универсал", "Открытый"]
    
    let transmissions = ["Автомат", "Механика"]
    
    let years = ["2000", "2001", "2002", "2003", "2004", "2005",
                 "2006", "2007", "2008", "2009", "2010", "2011",
                 "2012", "2013", "2014", "2015", "2016", "2017",
                 "2018", "2019", "2020"]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Form {
                        Section {
                            TextField("Производитель", text: $manufacturer)
                            TextField("Модель", text: $modelName)
                            TextField("Комплектация", text: $type)
                            TextField("Тип кузова", text: $bodyType)
                            TextField("Трансмиссия", text: $transmission)
                            TextField("Дата выпуска", text: $year)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    selectedCar[0].manufacturer = manufacturer
                    selectedCar[0].modelName = modelName
                    selectedCar[0].bodyType = bodyType
                    selectedCar[0].transmission = transmission
                    selectedCar[0].year = year
                    CoreDataManager.defaults.save()
                    showSheetView.toggle()
                    
                }) {
                    Text("Сохранить")
                        .frame(width: 350, height: 40)
                }
                
                .onAppear(perform: {
                    self.modelName = self.selectedCar[0].modelName ?? ""
                    self.manufacturer = self.selectedCar[0].manufacturer ?? ""
                    self.bodyType = self.selectedCar[0].bodyType ?? ""
                    self.transmission = self.selectedCar[0].transmission ?? ""
                    self.year = self.selectedCar[0].year ?? ""
                    self.type = self.selectedCar[0].type ?? ""
                })
                .onDisappear(perform: {self.selectedCar[0].isSelected = false})
                
            }
            .navigationBarTitle("\(manufacturer) \(modelName)")
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {self.showSheetView = false}, label: {
                                            Text("Назад")
                                        })
                                    }
            )
        }
    }
}
