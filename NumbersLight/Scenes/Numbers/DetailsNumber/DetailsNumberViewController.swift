//
//  DetailsNumberViewController.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import UIKit

class DetailsNumberViewController: UIViewController {
    @IBOutlet weak var numberImageView: RemoteImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var viewModel: DetailsNumber.FetchDetails.ViewModel? {
        didSet {
            updateUI()
        }
    }


    var numberName: String
    var interactor: DetailsNumberInteractable
    var router: DetailsNumberRoutable

    init?(coder: NSCoder, interactor: DetailsNumberInteractable, router: DetailsNumberRoutable, numberName name: String) {
        self.interactor = interactor
        self.router = router
        self.numberName = name
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("You should inject an interactor , a router and a numberName to create instance ")
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor.updateDisplayable(displayable: self)
        title = numberName
        loadDetails()
    }

    func loadDetails() {
        interactor.fetchDetailsNumber(request: DetailsNumber.FetchDetails.Request(name: numberName))
    }

    func updateUI() {
        DispatchQueue.main.async() { [weak self] in
            self?.title = self?.viewModel?.displayedDetails.name
            if let urlString = self?.viewModel?.displayedDetails.image, let url = URL(string: urlString) {
                self?.numberImageView.download(from: url)
            }
            self?.descriptionLabel.text = self?.viewModel?.displayedDetails.description
        }
    }
    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension DetailsNumberViewController: DetailsNumberDisplayable {
    func displayDetails(withViewModel viewModel: DetailsNumber.FetchDetails.ViewModel) {
        DispatchQueue.main.async() { [weak self] in
            self?.viewModel = viewModel
        }
    }

    func displayLoading(show: Bool) {
        //
    }

    func displayError() {
        //
    }


}
