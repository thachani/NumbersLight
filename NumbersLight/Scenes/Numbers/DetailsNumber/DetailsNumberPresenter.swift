//
//  DetailsNumbersPresentable.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class DetailsNumberPresenter {
    internal  weak var display: DetailsNumberDisplayable?
    
    init(display: DetailsNumberDisplayable?) {
        self.display = display
    }
    
    init() {}
}

extension DetailsNumberPresenter: DetailsNumberPresentable {
    func handleLoading(show: Bool) {
        //
    }
    
    func presentLoadedDetails(response: DetailsNumber.FetchDetails.Response) {
        
        guard let details = response.numberDetail else {
            //TODO:- PRESENT ERROR
            return
        }
        let displayedDetails = DetailsNumber.FetchDetails.ViewModel.DisplayedDetails(name: details.number, image: details.image, description: details.description)
        
        display?.displayDetails(withViewModel: DetailsNumber.FetchDetails.ViewModel(displayedDetails: displayedDetails))
    }
    
    func presentError(error: NumbersStoreError) {
        //
    }
    
    
}

