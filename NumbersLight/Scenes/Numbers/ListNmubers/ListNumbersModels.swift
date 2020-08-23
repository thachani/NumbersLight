//
//  ListNumbersModels.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 19/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

enum ListNumbers {

    enum FetchNumbers {

        struct Request {}

        struct Response {
            var numbers: [Number]?
        }

        struct ViewModel {

            struct DisplayedNumber {
                var name: String
                var image: String
            }

            var displayedNumbers: [DisplayedNumber]

        }
    }
}
