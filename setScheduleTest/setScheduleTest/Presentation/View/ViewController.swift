//
//  ViewController.swift
//  setScheduleTest
//
//  Created by JMC on 29/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: BaseViewController {
    private let tableView = UITableView()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.tintColor = .brown
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = true
        self.definesPresentationContext = true
        
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        super.initView()
        //setup tableview
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 0, enableInsets: true)
        
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        // tableview delegate
//        tableView.delegate = self
//        tableView.dataSource = self
        
        //cell registration
        tableView.register(SearchItemCell.self, forCellReuseIdentifier: SearchItemCellConfig.reuseId)
        
        //add serch controller
        self.navigationItem.titleView = self.searchController.searchBar
    }
    
    //when theme change, we can also define dark mode color option in color asset
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch (traitCollection.userInterfaceStyle) {
            case .dark:
                searchController.searchBar.backgroundColor = .black
                tableView.backgroundColor = .black
                break
                
            case .light:
                searchController.searchBar.backgroundColor = .white
                tableView.backgroundColor = .white
                break
                
            default:
                break
        }
        
        tableView.reloadData()
    }
    
    override func bindViewModel() {
        let viewModel = SearchViewModel()
        viewModel
            .searchData()
            .observe(on: MainScheduler.asyncInstance).subscribe(onNext: {
                        response in
            
                        print("response = \(response.count)")
            
                    } , onError: {
                        error in
            
                        guard let networkError = error as? NetworkError else {
                            return
                        }
            
                        print("Error = \(networkError.errorMessage)")
                    }, onCompleted: nil, onDisposed: nil)
    }

}

//MARK: UISeacrController Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        githubViewModel.searchUser(searchText: searchText)
//        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        view.endEditing(true)
//        tableView.reloadData()
    }
}
