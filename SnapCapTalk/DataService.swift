//
//  DataService.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 20.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    private static var _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainReference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var userRef: FIRDatabaseReference {
        return mainReference.child(FIR_CHILD_USERS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName":"", "lastName":""]
        mainReference.child(FIR_CHILD_USERS).child(uid).child(FIR_CHILD_PROFILE).setValue(profile)
    }
    
}
