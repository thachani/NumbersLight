//
//  DetailsNumberInterfaces.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

// MARK: - Interactable

protocol DetailsNumberInteractable {
    func fetchDetailsNumber(request: DetailsNumber.FetchDetails.Request)
    func updateDisplayable(displayable: DetailsNumberDisplayable)
}

// MARK: - Displayable

protocol DetailsNumberDisplayable: AnyObject {
    func displayDetails(withViewModel viewModel: DetailsNumber.FetchDetails.ViewModel)
    func displayLoading(show: Bool)
    func displayError()
}

// MARK: - Routable

protocol DetailsNumberRoutable {

}

// MARK: - Presentable

protocol DetailsNumberPresentable {
    var display: DetailsNumberDisplayable? { get set }

    func handleLoading(show: Bool)
    func presentLoadedDetails(response: DetailsNumber.FetchDetails.Response)
    func presentError(error: NumbersStoreError)
}
