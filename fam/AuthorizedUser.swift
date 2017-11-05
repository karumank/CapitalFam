//
//  AuthorizedUser.swift
//  fam
//
//  Created by Krishna on 04/11/17.
//  Copyright © 2017 Krishna. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase

class AuthorizedUser : Decodable{
    
    let account_id: String!
    let userRole: String!
    let customerId: String!
    let firstName: String!
    // MARK: Initialization
    init(accountId: String, userRole: String, customerId: String, firstName: String) {
        //self.key = key
        self.account_id = accountId
        self.userRole = userRole
        self.customerId = customerId
        self.firstName = firstName
    }
    
    init(snapshot: FIRDataSnapshot) {
        account_id = (snapshot.value as? NSDictionary)?["account_id"] as! String
        userRole = (snapshot.value as? NSDictionary)?["userRole"] as! String
        customerId = (snapshot.value as? NSDictionary)?["customerId"] as! String
        firstName = (snapshot.value as? NSDictionary)?["firstName"] as! String
       
    }
    
    
    init(snapshot: Dictionary<String,AnyObject>) {
        account_id = snapshot["account_id"] as! String
        userRole = snapshot["userRole"] as! String
        customerId = snapshot["customerId"] as! String
        firstName = snapshot["firstName"] as! String
    }
    
    
    func toDictionary() -> [String:String] {
        return [
            "account_id": account_id,
            "userRole": userRole,
            "customerId": customerId,
            "firstName": firstName,
        ]
    }
}
