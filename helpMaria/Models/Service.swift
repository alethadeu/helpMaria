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
    
    init(name: String, serviceType: ServiceType ) {
        self.name           = name
        self.serviceType    = serviceType
    }
    
}
