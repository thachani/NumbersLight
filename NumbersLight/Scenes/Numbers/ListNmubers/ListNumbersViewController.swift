//
//  ListNumbersViewController.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 19/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import UIKit

class ListNumbersViewController: UIViewController {
    var interactor: ListNumbersInteractable
    var router: ListNumbersRoutable
    var viewModel: ListNumbers.FetchNumbers.ViewModel?
    var dataSource: ListNumbersDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet var retryView: UIView!
    
    
    init?(coder: NSCoder, interactor: ListNumbersInteractable, router: ListNumbersRoutable) {
        self.interactor = interactor
        self.router = router
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You should inject an interactor and a router to create instance ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Numbers"
        
        // Do any additional setup after loading the view.
        setupTableView()
        registerCells()
        
        interactor.updateDisplayable(displayable: self)
        router.rootNavigation = self.navigationController

        loadNumbers()
    }

    
    func loadNumbers() {
        interactor.fetchNumbers(request: ListNumbers.FetchNumbers.Request())
    }
    
    func setupTableView() {
        dataSource = ListNumbersDataSource(withDataPrvider: self)
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.rowHeight = 60
        configureRefreshControl()
        
    }
    
    func registerCells() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NumberTableViewCell", bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: NumberTableViewCell.reuseIdentifier)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func retryTapped(_ sender: Any) {
        loadNumbers()
    }
    
}

//MARK: - Data Provider

extension ListNumbersViewController: NumbersDataProvider {
    
}

//MARK: - Delegate tableView

extension ListNumbersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let selectedNumber = viewModel?.displayedNumbers[indexPath.row].name {
            router.routeToDetails(forNumber: selectedNumber)
        }
    }
}


// MARK: - Displayable

extension ListNumbersViewController: ListNumbersDisplayable {
    func displayLoading(show: Bool) {
        DispatchQueue.main.async() { [weak self] in
            if show {
                self?.loadingView.startAnimating()
            } else {
                self?.loadingView.stopAnimating()
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    func displayNumbers(withViewModel viewModel: ListNumbers.FetchNumbers.ViewModel) {
        DispatchQueue.main.async() { [weak self] in
            self?.viewModel = viewModel
            self?.tableView.reloadData()
        }
    }
    
    func displayError() {
        // Add ERROR UI
    }
    
    func displayRetryView(hidden: Bool) {
        DispatchQueue.main.async() { [weak self] in
            self?.retryView.isHidden = hidden
        }
    }
}

// MARK: - Pull to refresh

private extension ListNumbersViewController {
    
    func configureRefreshControl () {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc
    func handleRefreshControl() {
        loadNumbers()
    }
}
