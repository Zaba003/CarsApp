//
//  CoreData+Extension.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 17.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import Foundation
import CoreData

//=================================================
//MARK: Extension Car
extension Car{
    
    
    /// FetchRequest for all car, sorted by name
    static func CarsFetchRequest() -> NSFetchRequest<Car> {
        let request: NSFetchRequest<Car> = Car.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Car.modelName, ascending: true)]
        return request
    }
    
    /// FetchRequest for selected car, sorted by name
    static func SelectedCarFetchRequest() -> NSFetchRequest<Car> {
        let request: NSFetchRequest<Car> = Car.CarsFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Car.modelName, ascending: true)]
        request.predicate = NSPredicate(
            format: "isSelected == %@",
            argumentArray: [true]
        )
        
        return request
    }
    
}
