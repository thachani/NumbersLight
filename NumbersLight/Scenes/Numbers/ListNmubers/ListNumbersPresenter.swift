//
//  ListNumbersPresenter.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 22/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class ListNumberPresenter {
    internal  weak var display: ListNumbersDisplayable?

    init(display: ListNumbersDisplayable?) {
        self.display = display
    }

    init() {}
}

extension ListNumberPresenter: ListNumberPresentable {
    func presentLoadedNumbers(response: ListNumbers.FetchNumbers.Response) {
        guard let numbers = response.numbers else { return }

        let displayedNumbers = numbers.map {
            ListNumbers.FetchNumbers.ViewModel.DisplayedNumber(name: $0.number, image: $0.image) }
        let viewModel = ListNumbers.FetchNumbers.ViewModel(displayedNumbers: displayedNumbers)
        display?.displayNumbers(withViewModel: viewModel)
    }

    func presentError(error: NumbersStoreError) {
        display?.displayError()
    }

    func handleLoading(show: Bool) {
        display?.displayLoading(show: show)
    }

    func presentRetryView(hidden: Bool) {
        display?.displayRetryView(hidden: hidden)
    }

}
