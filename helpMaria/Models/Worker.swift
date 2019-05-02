//
//  Worker.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation

struct Worker {
    var name         : String?
    var rate         : Double?
    var premium      : Bool?
    var fav          : Bool?
    var services     : [ServiceType]
    var certificates : [Certificate]
    
    init(name: String, rate: Double, premium: Bool, fav: Bool, services: [ServiceType], certificates: [Certificate]) {
        self.name = name
        self.rate = rate
        self.premium = premium
        self.fav = fav
        self.services = services
        self.certificates = certificates
    }
    
}
