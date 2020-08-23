//
//  NumbersMockStore.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class NumbersMockStore: NumbersStorable {
    func fetchDetails(forNumber name: String, completion: @escaping DetailsNumberCompletion) {
        //
        completion(.failure(error: .numbersFetching(description: "mock not implemented yet")))
    }

    func fetchNumbers(_ completion: @escaping NumbersStoreCompletion) {
    NetworkManager.shared.perform { networkResult in
            switch networkResult {
            case .success(let data):
                do {
                    let listNumbersResponse = try JSONDecoder().decode(ListNumbersResponse.self, from: data)
                    completion(.success(result: listNumbersResponse.numbers))
                }
                catch let parsingError{
                    completion(.failure(error: .numbersFetching(description: parsingError.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(error: .numbersFetching(description: error.localizedDescription)))
            }
        }
    }


}
