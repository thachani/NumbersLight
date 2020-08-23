//
//  DetailsNumbersInteractor.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class DetailsNumbersInteractor {
    var presenter: DetailsNumberPresentable
    var worker: NumbersWorker
    
    init(withPresenter presenter: DetailsNumberPresentable = DetailsNumberPresenter(), worker: NumbersWorker = NumbersWorker(store: NumbersAPI())) {
        self.presenter = presenter
        self.worker = worker
    }
    
}

extension DetailsNumbersInteractor: DetailsNumberInteractable {
    func fetchDetailsNumber(request: DetailsNumber.FetchDetails.Request) {
        worker.fetchDetails(forNumber: request.name) { [weak self] result in
            switch result {
            case .success(let detailsNumber):
                self?.presenter.presentLoadedDetails(response: DetailsNumber.FetchDetails.Response(numberDetail: detailsNumber))
            case .failure(let error):
                self?.presenter.presentError(error: error)
            }
        }
    }
    
    func updateDisplayable(displayable: DetailsNumberDisplayable) {
        presenter.display = displayable
    }
}
