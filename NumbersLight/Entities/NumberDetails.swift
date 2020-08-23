//
//  NumberDetail.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct NumberDetails: Decodable {
    let number: String
    let image: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case number = "name"
        case image
        case description = "text"
    }
}
