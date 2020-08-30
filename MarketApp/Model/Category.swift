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
    
    FirebaseReference(.Category).document(id)
        .setData(categoryDictionaryFrom(category) as! [String : Any])
}

//MARK: - Helpers

func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    
    return NSDictionary(
        objects: [category.id, category.name, category.imageName],
        forKeys: [kObjectId as NSCopying, kName as NSCopying, kImageName as NSCopying]
    )
}
