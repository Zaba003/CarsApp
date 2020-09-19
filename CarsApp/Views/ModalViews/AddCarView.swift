//
//  AddCarView.swift
//  CarGuideApp
//
//  Created by Кирилл Заборский on 16.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct AddCarView: View {

    @Binding var showSheetView: Bool
    
    @State private var modelName = ""
    @State private var manufacturer = ""
    @State private var bodyType = ""
    @State private var transmission = ""
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
            Form {
                Section {
                    TextField("Производитель", text: $manufacturer)
                    TextField("Модель", text: $modelName)
                    TextField("Комплектация", text: $type)
                    Picker("Тип кузова", selection: $bodyType) {
                        ForEach(bodyTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Трансмиссия", selection: $transmission) {
                        ForEach(transmissions, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Дата выпуска", selection: $year) {
                        ForEach(years, id: \.self) {
                            Text("\(String($0))")
                        }
                    }
                }
                Section {
                    Button("Сохранить") {
                        // Добавить автомобиль
                        CoreDataManager.defaults.createCar(manufacturer: manufacturer, modelName: modelName, bodyType: bodyType, transmission: transmission, year: year, type: type)
                        self.showSheetView = false
                    }
                }
                .navigationBarTitle("Добавить авто")
                .navigationBarItems(leading:
                                        Button(action: {
                                            self.showSheetView = false
                                        }) {
                                            Text("Назад")
                                        }
                )
            }
        }
    }
}

//struct AddCar_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCarView()
//    }
//}

