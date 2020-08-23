//
//  NumbersResponse.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class ListNumbersResponse: Decodable {
    let numbers: [Number]

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        numbers = try container.decode([Number].self)
    }
}
