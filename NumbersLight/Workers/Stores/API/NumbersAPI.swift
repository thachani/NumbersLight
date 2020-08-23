//
//  NumbersAPI.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

struct NumbersRouter {
    private let baseUrl = URL(string: "http://dev.tapptic.com/test/json.php")!
    var listUrl: URL {
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to Create URL Components")
        }

        components.queryItems = []

        guard let url = components.url else {
            fatalError("Unable to Create URL")
        }
        return url
    }

    func detailUrl(forNumber name: String) -> URL {
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to Create URL Components")
        }

        components.queryItems = [
            URLQueryItem(name: "name", value: "\(name)"),
        ]

        guard let url = components.url else {
            fatalError("Unable to Create URL")
        }
        return url
    }
}

class NumbersAPI: NumbersStorable {
    func fetchNumbers(_ completion: @escaping NumbersStoreCompletion) {
        let request = URLRequest(url: NumbersRouter().listUrl, cachePolicy: .reloadIgnoringLocalCacheData)

        NetworkManager.shared.perform(request) { networkResult in
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

    func fetchDetails(forNumber name: String, completion: @escaping DetailsNumberCompletion) {
        let request = URLRequest(url: NumbersRouter().detailUrl(forNumber: name), cachePolicy: .reloadIgnoringLocalCacheData)

        NetworkManager.shared.perform(request) { networkResult in
            switch networkResult {
            case .success(let data):
                do {
                    let detailsNumberResponse = try JSONDecoder().decode(DetailsNumberResponse.self, from: data)
                    completion(.success(result: detailsNumberResponse.details))
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
