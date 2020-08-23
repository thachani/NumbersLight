//
//  DetailsNumberModels.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

enum DetailsNumber {

    enum FetchDetails {

        struct Request {
            let name: String
        }

        struct Response {
            var numberDetail: NumberDetails?
        }

        struct ViewModel {

            struct DisplayedDetails{
                var name: String
                var image: String
                var description: String
            }

            var displayedDetails: DisplayedDetails

        }
    }
}
