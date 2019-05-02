//
//  Certificates.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation

struct Certificate {
    var name        : String?
    var foudation   : String?
    var area        : [ServiceType]
    var descrition  : String?
    
    init(name: String, foudation: String, area: [ServiceType], descrition: String) {
        self.name       = name
        self.foudation  = foudation
        self.area       = area
        self.descrition = descrition
    }
}
