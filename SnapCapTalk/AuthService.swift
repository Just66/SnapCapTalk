//
//  AuthService.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 19.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    typealias Completion = (_ errMsg: String?,_ data: Any?) -> Void
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login (email: String, password: String, onCompletion: @escaping Completion) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseErrors(error: error as! NSError, onComplete: onCompletion)
                            } else {
                                if user?.uid != nil {
                                    // Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            //Show error
                                        } else {
                                            // logged in
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // handle all the other errors
                }
            } else {
                // Succesfull
            }
            
        })
        
    }
    
    func handleFirebaseErrors(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email", nil)
                break
            case .errorCodeWrongPassword:
            onComplete?("Invalid password", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Could not create account email is already in use", nil)
                break
            
            default:
                onComplete?("Hmm we got the problem try again later", nil)
            }
        }
    }

}
