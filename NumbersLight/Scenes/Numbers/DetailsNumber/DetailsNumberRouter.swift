//
//  DetailsNumberRouter.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import UIKit

class DetailsNumberRouter {
    weak var rootNavigation: UINavigationController?

    init(withRoot rootNav: UINavigationController? = nil) {
        self.rootNavigation = rootNav
    }
}

extension DetailsNumberRouter: DetailsNumberRoutable {
}

