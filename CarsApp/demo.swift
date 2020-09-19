//
//  demo.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 17.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import SwiftUI

struct demo: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Toyota")
                    .font(.largeTitle)
                Text("Camry")
                    .font(.title)
            }
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct demo_Previews: PreviewProvider {
    static var previews: some View {
        demo()
    }
}
