//
//  Services.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation

struct Service  {
    var name            : String?
    var serviceType     : ServiceType?
    var resumeName      : String?
    var description     : String?
    var price           : Double?
    
    init(name: String, serviceType: ServiceType, resumeName: String, description: String, price: Double) {
        self.name           = name
        self.serviceType    = serviceType
        self.resumeName     = resumeName
        self.description    = description
        self.price          = price
    }
    
}
