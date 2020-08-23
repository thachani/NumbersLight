//
//  DetailsNumberResponse.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class DetailsNumberResponse: Decodable {
    let details: NumberDetails

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        details = try container.decode(NumberDetails.self)
    }
}
