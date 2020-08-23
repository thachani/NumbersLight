//
//  NumbersWorkerInterfaces.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

enum NumbersStoreError: Error {
    case unknown
    case numbersFetching(description: String)
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "erreur inconnue"
        case .numbersFetching(let description):
            return description
        }
    }
}

enum NumbersStoreResult<T> {
    case success(result: T)
    case failure(error: NumbersStoreError)
}

typealias NumbersStoreCompletion = (NumbersStoreResult<[Number]>) -> Void
typealias DetailsNumberCompletion = (NumbersStoreResult<NumberDetails>) -> Void

protocol NumbersStorable {
    func fetchNumbers(_ completion: @escaping NumbersStoreCompletion)
    func fetchDetails(forNumber name: String, completion: @escaping DetailsNumberCompletion)
}
