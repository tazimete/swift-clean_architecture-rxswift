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
    
    private let disposeBag = DisposeBag()
    private let searchTrigger = PublishSubject<Void>()
    private let tableView = UITableView()

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
        
        //cell registration
        tableView.register(SearchItemCell.self, forCellReuseIdentifier: SearchItemCellConfig.reuseId)
    }
    
    override func initNavigationBar() {
        self.navigationItem.title = "Search"
        let btnSearch = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        btnSearch.tintColor = .black
        self.navigationItem.rightBarButtonItem = btnSearch
    }
    
    override func bindViewModel() {
        let searchViewModel = (viewModel as? AbstarctSearchViewModel) ?? SearchViewModel()
        let searchInput = SearchViewModel.SearchInput(searchItemListTrigger: searchTrigger)
        let searchOutput = searchViewModel.getSearchOutput(input: searchInput)
        
        searchOutput.searchItems
            .bind(to: tableView.rx.items(cellIdentifier: SearchItemCellConfig.reuseId)) { row, model, cell in
                guard let cell = cell as? SearchItemCell else {
                    return
                }
            cell.lblUsername.text = "\(model.title ?? "") from \(model.originalTitle ?? "")"
        }.disposed(by: disposeBag)
        
        searchOutput.errorTracker.subscribe(onNext: {
            [weak self] error in
            
            guard let weakSelf = self, let error = error else {
                return 
            }
            
            print("\(weakSelf.TAG) -- bindViewModel() -- error  -- code = \(error.errorCode), message = \(error.errorMessage)")
        }).disposed(by: disposeBag)
    }
    
    @objc func didTapSearchButton(sender : AnyObject){
        let alertController = UIAlertController(title: "Search movie", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Movie name"
        }
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Releasing year"
        }
        
        let saveAction = UIAlertAction(title: "Search", style: UIAlertAction.Style.default, handler: { [weak self] alert -> Void in
            let name = (alertController.textFields?[0] as? UITextField)?.text ?? ""
            let year = (alertController.textFields?[1] as? UITextField)?.text ?? ""
            
            if !name.isEmpty && !year.isEmpty {
                self?.searchMovie(name: name, year: Int(year) ?? 00)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func searchMovie(name: String, year: Int) {
        searchTrigger.onNext(())
    }
}

//MARK: UISeacrController Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        githubViewModel.searchUser(searchText: searchText)
//        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        view.endEditing(true)
//        tableView.reloadData()
    }
}
