//
//  FirebaseCollectionReference.swift
//  MarketApp
//
//  Created by Jamie on 2020/08/30.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
