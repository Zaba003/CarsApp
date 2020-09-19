//
//  ListCars.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 19.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct ListCars: View {
    @FetchRequest(fetchRequest: Car.CarsFetchRequest()) var allCars: FetchedResults<Car>
    
    @Binding var selectedModal: Int
    @Binding var showSheetView: Bool
    
    
    var body: some View {
        ForEach(allCars, id: \.id){car in
            CarRow(
                car: car,
                selectedModal: self.$selectedModal,
                showSheetView: self.showSheetView
            )
            
        }.onDelete(perform: CoreDataManager.defaults.removeCar )
    }
}

//struct ListCars_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCars()
//    }
//}
