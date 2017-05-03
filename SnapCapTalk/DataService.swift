//
//  DataService.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 20.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    
    private static var _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainReference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://snapcaptalk.appspot.com")
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    var userRef: FIRDatabaseReference {
        return mainReference.child(FIR_CHILD_USERS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName":"", "lastName":""]
        mainReference.child(FIR_CHILD_USERS).child(uid).child(FIR_CHILD_PROFILE).setValue(profile)
    }
    
    
    func sendMediaPullRequest(senderUID: String, sendingTo:Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }
        
        let pr: Dictionary<String, AnyObject> = ["mediaURL":mediaURL.absoluteString as AnyObject, "userID":senderUID as AnyObject, "openCount": 0 as AnyObject, "recipients": uids as AnyObject]
        
        mainReference.child("pullRequests").childByAutoId().setValue(pr)
        
    }

}
