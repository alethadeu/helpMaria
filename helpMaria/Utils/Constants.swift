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
    Service(name: "manutenção de chuveiros",
            serviceType: .shower,
            resumeName: "chuveiros",
            description: "instalações e manutencções gerais em chuveiros elétricos da sua casa.",
            price: 50.0
    ),
    Service(name: "manutenção elétrica",
            serviceType: .eletric,
            resumeName: "elétrica",
            description: "instalação e troca de interruptores, lampadas e tomadas.",
            price: 80.0
    ),
    Service(name: "montagem de móveis",
            serviceType: .furniture,
            resumeName: "móveis",
            description: "montagem e desmontagem de armários, estantes, camas e móveis em gerais.",
            price: 75.0
    ),
    Service(name: "instalação de tv",
            serviceType: .television,
            resumeName: "televisão",
            description: "instalação de suporte de televisão.",
            price: 30.0
    ),
    Service(name: "serviço de pintura",
            serviceType: .paint,
            resumeName: "pintura",
            description: "pintura de paredes, com o valor variado pelo metro.",
            price: 40.0
    ),
    Service(name: "manutenção hidráulica",
            serviceType: .hydraulic,
            resumeName: "hidráulica",
            description: "troca de torneiras e encanamentos simples",
            price: 80.0
    ),
    Service(name: "outros serviços",
            serviceType: .others,
            resumeName: "outros",
            description: "serviços diversos",
            price: 0.0
    )
]

let marias : [Worker] = [
    Worker(name: "Thaís Ayumi", rate: 5.0, premium: true, fav: true, services: [.shower, .hydraulic], certificates: []),
    Worker(name: "Julliana Suemi", rate: 5.0, premium: false, fav: false, services: [.eletric] , certificates: []),
    Worker(name: "Emanuelle Luiza", rate: 5.0, premium: false, fav: false, services: [.television], certificates: []),
    Worker(name: "Sabrina Mota", rate: 5.0, premium: false, fav: false, services: [.furniture, .paint], certificates: []),
    Worker(name: "Tamires Lima", rate: 5.0, premium: false, fav: false, services: [.shower], certificates: []),
    Worker(name: "Ana Laura", rate: 5.0, premium: false, fav: false, services: [.others, .hydraulic], certificates: []),
    Worker(name: "Gustavina Pereirão", rate: 4.5, premium: false, fav: false, services: [.shower, .hydraulic, .television, .furniture, .hydraulic], certificates: []),
    Worker(name: "Joana Silva", rate: 4.75, premium: true, fav: true, services: [.shower, .hydraulic], certificates: []),
    Worker(name: "Maria da Penha", rate: 4.8, premium: false, fav: false, services: [.eletric] , certificates: []),
    Worker(name: "Luzia Marx", rate: 5.0, premium: false, fav: false, services: [.television], certificates: []),
    Worker(name: "Vitória Macedo", rate: 4.9, premium: false, fav: false, services: [.furniture, .paint], certificates: []),
    Worker(name: "Daiane Tavares", rate: 4.45, premium: false, fav: false, services: [.shower], certificates: []),
    Worker(name: "Sônia Lobo", rate: 4.95, premium: false, fav: false, services: [.others, .hydraulic], certificates: []),
    Worker(name: "Cecila Lemes", rate: 4.5, premium: false, fav: false, services: [.shower, .hydraulic, .television, .furniture, .hydraulic], certificates: [])
    
]

let banners : [UIImage] = [
    UIImage(named: "banner_1")!,
    UIImage(named: "banner_2")!
]
