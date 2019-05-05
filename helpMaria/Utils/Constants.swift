//
//  Constants.swift
//  helpMaria
//
//  Created by Thais Ayumi on 04/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation
import UIKit

let services : [Service] = [
    Service(name: "manutenção de chuveiros", serviceType: .shower),
    Service(name: "manutenção elétrica", serviceType: .eletric),
    Service(name: "montagem de móveis", serviceType: .furniture),
    Service(name: "instalação de tv", serviceType: .television),
    Service(name: "serviço de pintura", serviceType: .paint),
    Service(name: "manutenção hidráulica", serviceType: .hydraulic),
    Service(name: "outros serviços", serviceType: .others)
]

let marias : [Worker] = [
    Worker(name: "Thaís Ayumi", rate: 5.0, premium: true, fav: true, services: [.shower, .hydraulic], certificates: []),
    Worker(name: "Julliana Suemi", rate: 5.0, premium: false, fav: false, services: [.eletric] , certificates: []),
    Worker(name: "Emanuelle Luiza", rate: 5.0, premium: false, fav: false, services: [.television], certificates: []),
    Worker(name: "Sabrina Mota", rate: 5.0, premium: false, fav: false, services: [.furniture, .paint], certificates: []),
    Worker(name: "Tamires Lima", rate: 5.0, premium: false, fav: false, services: [.shower], certificates: []),
    Worker(name: "Ana Laura", rate: 5.0, premium: false, fav: false, services: [.others, .hydraulic], certificates: []),
    Worker(name: "Gustavina Pereirão", rate: 4.5, premium: false, fav: false, services: [.shower, .hydraulic, .television, .furniture, .hydraulic], certificates: [])
    
]

let banners : [UIImage] = [
    UIImage(named: "banner_1")!,
    UIImage(named: "banner_2")!
]
