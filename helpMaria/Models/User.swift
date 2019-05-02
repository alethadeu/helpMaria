//
//  User.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation

struct User {
    var name            :     String?
    var email           :     String?
    var cpf             :     String?
    var phone           :     String?
    var password        :     String?
    
    init(name: String, email: String, cpf: String, phone: String, password: String) {
        self.name       = name
        self.email      = email
        self.cpf        = cpf
        self.phone      = phone
        self.password   = password
    }
}
