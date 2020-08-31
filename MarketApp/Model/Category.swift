//
//  Category.swift
//  MarketApp
//
//  Created by Jamie on 2020/08/30.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String) {
        
        id = ""
        name = _name
        image = UIImage(named: _imageName)
        imageName = _imageName
        
    }
    
    init(_dictionary: NSDictionary) {
        
        id = _dictionary[kObjectId] as! String
        name = _dictionary[kName] as! String
        image = UIImage(named: _dictionary[kImageName] as? String ?? "")
    }
}


//MARK: - Save Category Function

func saveCategoryToFirebase(_ category: Category) {
    
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
    
    
}


//MARK: Helpers

func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    
    return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [kObjectId as NSCopying, kName as NSCopying, kImageName as NSCopying])
}

//use only one time
func createCategorySet() {

    let womenClothing = Category(_name: "Women's Clothing & Accessories", _imageName: "womenCloth")
    let footWaer = Category(_name: "Footwaer", _imageName: "footWaer")
    let electronics = Category(_name: "Electronics", _imageName: "electronics")
    let menClothing = Category(_name: "Men's Clothing & Accessories" , _imageName: "menCloth")
    let health = Category(_name: "Health & Beauty", _imageName: "health")
    let baby = Category(_name: "Baby Stuff", _imageName: "baby")
    let home = Category(_name: "Home & Kitchen", _imageName: "home")
    let car = Category(_name: "Automobiles & Motorcyles", _imageName: "car")
    let luggage = Category(_name: "Luggage & bags", _imageName: "luggage")
    let jewelery = Category(_name: "Jewelery", _imageName: "jewelery")
    let hobby =  Category(_name: "Hobby, Sport, Traveling", _imageName: "hobby")
    let pet = Category(_name: "Pet products", _imageName: "pet")
    let industry = Category(_name: "Industry & Business", _imageName: "industry")
    let garden = Category(_name: "Garden supplies", _imageName: "garden")
    let camera = Category(_name: "Cameras & Optics", _imageName: "camera")

    let arrayOfCategories = [womenClothing, footWaer, electronics, menClothing, health, baby, home, car, luggage, jewelery, hobby, pet, industry, garden, camera]

    for category in arrayOfCategories {
        saveCategoryToFirebase(category)
    }

}
