//
//  Number.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 19/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct Number: Decodable {
    let number: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case number = "name"
        case image
    }
}
