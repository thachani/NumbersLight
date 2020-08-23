//
//  ListNumbersInterfaces.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 19/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interactable

protocol ListNumbersInteractable {
    func fetchNumbers(request: ListNumbers.FetchNumbers.Request)
    func updateDisplayable(displayable: ListNumbersDisplayable)
}

// MARK: - Displayable

protocol ListNumbersDisplayable: AnyObject {
    func displayNumbers(withViewModel viewModel: ListNumbers.FetchNumbers.ViewModel)
    func displayLoading(show: Bool)
    func displayError()
    func displayRetryView(hidden: Bool)
}

// MARK: - Routable

protocol ListNumbersRoutable {
    var rootNavigation: UINavigationController? { get set}
    func routeToDetails(forNumber name: String)
}

// MARK: - Presentable

protocol ListNumberPresentable {
    var display: ListNumbersDisplayable? { get set }
    
    func handleLoading(show: Bool)
    func presentLoadedNumbers(response: ListNumbers.FetchNumbers.Response)
    func presentError(error: NumbersStoreError)
    func presentRetryView(hidden: Bool)
}
