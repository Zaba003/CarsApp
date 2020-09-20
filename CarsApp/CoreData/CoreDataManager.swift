//
//  CoreDataManager.swift
//  CarsApp
//
//  Created by Кирилл Заборский on 17.09.2020.
//  Copyright © 2020 Кирилл Заборский. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    //=================================================
    //MARK: Setup
    
    
    /// Singleton Pattern
    static let defaults = CoreDataManager()
    private init() {
    }
    
    
    /// Context
    var myContext : NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    /// Save Context, if changes were made
    func save(){
        if myContext.hasChanges {
            do {
                try myContext.save()
                //print("saved")
            } catch {
                // handle the Core Data error
                print("Error while saving managedObjectContext: \(error)")
            }
        }
    }
    
    
    
    //=================================================
    //MARK: Create
    
    
    /// Create the app settings when the App first starts
    func createAppsetting(){
        createExampleData()
        self.save()
    }
    
    /// Creates a car
    func createCar(manufacturer: String, modelName: String, bodyType: String, transmission: String, year: String , type: String){
        let car = Car(context: myContext)
        car.id = UUID()
        car.modelName = modelName
        car.manufacturer = manufacturer
        car.bodyType = bodyType
        car.transmission = transmission
        car.year = year
        car.type = type
        car.isSelected = false
        self.save()
    }
    
    /// Create example car
    func createExampleData(){
        createCar(manufacturer: "Honda", modelName: "Accord", bodyType: "Седан", transmission: "Автомат", year: "2005", type: "Type S")
        createCar(manufacturer: "Toyota", modelName: "Camry", bodyType: "Седан", transmission: "Автомат", year: "2019", type: "2.5 AT Элеганс Safety")
        createCar(manufacturer: "Lexus", modelName: "RX300", bodyType: "Кроссовер", transmission: "Автомат", year: "2006", type: "3.3 AT 4WD")
        self.save()
    }
    
    
    
    //=================================================
    //MARK: Read
    
    /// Load all cars
    func loadAllCars() -> [Car]?{
        let myFetchRequest: NSFetchRequest<Car> = Car.CarsFetchRequest()
        do {
            let resultArray = try myContext.fetch(myFetchRequest)
            var returnValue = [Car]()
            for car in resultArray{
                returnValue.append(car)
            }
            return returnValue
        } catch {
            print("Error while loading all cars.", error.localizedDescription)
        }
        return nil
    }
    
    
    
    
    //=================================================
    //MARK: Delete
    
    func removeCar(at offsets: IndexSet) {
        if let cars = loadAllCars(){
            for index in offsets {
                let car = cars[index]
                myContext.delete(car)
            }
            save()
        }else {
            print("No car deleted")
        }
    }
    
    //=================================================
    //MARK: UpdateState
    class UpdateState: ObservableObject {
        @Published var isUpdate:Bool = false
    }
}
