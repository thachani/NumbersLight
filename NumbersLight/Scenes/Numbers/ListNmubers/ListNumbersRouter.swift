//
//  ListNumbersRouter.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 20/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import UIKit

class ListNumbersRouter {
    weak var rootNavigation: UINavigationController?
    
    init(withRoot rootNav: UINavigationController? = nil) {
        self.rootNavigation = rootNav
    }
}

extension ListNumbersRouter: ListNumbersRoutable {
    func routeToDetails(forNumber name: String) {
        let detailsNumberVC = UIStoryboard(name: "Numbers", bundle: nil).instantiateViewController(identifier: "DetailsNumberViewControllerStoryboardId", creator: { coder in
            return DetailsNumberViewController(coder: coder, interactor: DetailsNumbersInteractor(), router: DetailsNumberRouter(), numberName: name)
        })
        
        rootNavigation?.pushViewController(detailsNumberVC, animated: true)
        
    }
    
    
}
