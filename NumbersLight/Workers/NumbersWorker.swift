//
//  NumbersWorker.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

class NumbersWorker {
    private let store: NumbersStorable
    
    init(store: NumbersStorable) {
        self.store = store
    }
    
    func fetchNumbers(_ completion: @escaping NumbersStoreCompletion) {
        store.fetchNumbers { result in
            completion(result)
        }
    }
    
    func fetchDetails(forNumber name: String, completion: @escaping DetailsNumberCompletion) {
        store.fetchDetails(forNumber: name) { result in
            completion(result)
        }
    }
}

