//
//  Delegates.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 12/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation

protocol Filter {
    func apply(services: [Service])
}
