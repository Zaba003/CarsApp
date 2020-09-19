//
//  CarRow.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 16.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct CarRow: View {

    var car : Car
    @State var name: String = ""
    @Binding var selectedModal: Int
    @State var showSheetView: Bool
    
    var body: some View {
         VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack() {
                    VStack() {
                        VStack(alignment: .leading) {
                            HStack() {
                                Text("\(car.manufacturer ?? "Unknown manufacturer") \(car.modelName ?? "Unknown modelName"), \(car.year ?? "nil")")
                                Spacer()
                                HStack {
                                    Button(action: {
                                            self.showSheetView = true
                                            self.car.isSelected = true

                                    }) {
                                        Image(systemName: "square.and.pencil")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                    }
                                    .sheet(isPresented: $showSheetView, content: {
                                                CarDetail(showSheetView: $showSheetView)
                                    })
                                }
                            }
                        }
                    }
                }
                Text("\(car.type ?? "Unknown type")")
                    .font(.footnote).foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                ScrollView(.horizontal) {
                    HStack {
                        Image("camry6")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry2")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry3")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry4")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry5")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry1")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry7")
                            .resizable().frame(width: 300, height: 169)
                        Image("camry8")
                            .resizable().frame(width: 300, height: 169)
                        
                    }
                }
                
                HStack {
                    Text("\(car.bodyType ?? "Unknown bodyType"), \(car.transmission ?? "Unknown transmission")")
                        .font(.subheadline)
                        .fontWeight(.light)
                }
            }
        } .padding()
    }
}

//struct CarRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CarRow(car: Car)
//    }
//}
