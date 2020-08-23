//
//  ListNumbersInteractor.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 20/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class ListNumbersInteractor {
    var presenter: ListNumberPresentable
    var worker: NumbersWorker

    init(withPresenter presenter: ListNumberPresentable, worker: NumbersWorker = NumbersWorker(store: NumbersAPI())) {
        self.presenter = presenter
        self.worker = worker
    }

}

extension ListNumbersInteractor: ListNumbersInteractable {
    func fetchNumbers(request: ListNumbers.FetchNumbers.Request) {
        guard NetworkMonitor.shared.isConnected() else {
            presenter.presentRetryView(hidden: false)
            return
        }
        presenter.handleLoading(show: true)

        worker.fetchNumbers { [weak self] result in
            self?.presenter.presentRetryView(hidden: true)
            self?.presenter.handleLoading(show: false)

            switch result {
            case .success(let numbers):
                self?.presenter.presentLoadedNumbers(response: ListNumbers.FetchNumbers.Response(numbers: numbers))
            case .failure(let error):
                self?.presenter.presentError(error: error)
            }
        }
    }

    func updateDisplayable(displayable: ListNumbersDisplayable) {
        presenter.display = displayable
    }
}
