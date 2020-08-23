//
//  ListNumbersDataSource.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 22/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import UIKit

protocol NumbersDataProvider {
    var viewModel: ListNumbers.FetchNumbers.ViewModel? { get }
}

class ListNumbersDataSource: NSObject, UITableViewDataSource {
    var dataProvider: NumbersDataProvider?

    init(withDataPrvider dataProvider: NumbersDataProvider) {
        self.dataProvider = dataProvider
        super.init()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.viewModel?.displayedNumbers.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.reuseIdentifier, for: indexPath) as? NumberTableViewCell else {
            fatalError("Unable to Dequeue TableViewCell")
        }
        let number = dataProvider?.viewModel?.displayedNumbers[indexPath.row].name
        let urlImage = dataProvider?.viewModel?.displayedNumbers[indexPath.row].image
        
        cell.update(withText: number, urlImage: urlImage)
        
        return cell
    }

}
