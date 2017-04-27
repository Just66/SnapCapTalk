//
//  User.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 20.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var firstName: String {
        return _firstName
    }
    
    var uid: String {
        return _uid
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
}
