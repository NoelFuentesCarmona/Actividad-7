//
//  loginResult.swift
//  Actividad1
//
//  Created by usuario on 1/11/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation

class loginResult: Decodable {
    var status : Bool;
     var message : String;
    var id : String?;
    var username : String?;
    var age : String?;
    var password : String?;
    var gender : String?;
    var name : String?;
    
    init?() {
       return nil
    }
    
}
