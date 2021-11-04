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
    public var searchViewModel: AbstractSearchViewModel!
    private let disposeBag = DisposeBag()
    private let searchTrigger = PublishSubject<SearchViewModel.SearchInputModel>()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        //cell registration
        tableView.register(SearchItemCell.self, forCellReuseIdentifier: SearchItemCellConfig.reuseId)
        tableView.register(SearchShimmerCell.self, forCellReuseIdentifier: ShimmerItemCellConfig.reuseId)
        return tableView
    }()

    init(viewModel: AbstractSearchViewModel) {
        super.init(viewModel: viewModel)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        super.initView()
        //setup tableview
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 0, enableInsets: true)
        
        //table view
        onTapTableviewCell()
    }
    
    override func initNavigationBar() {
        self.navigationItem.title = "Search"
        let btnSearch = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        btnSearch.tintColor = .black
        self.navigationItem.rightBarButtonItem = btnSearch
    }
    
    override func bindViewModel() {
        searchViewModel = (viewModel as! AbstractSearchViewModel)
        let searchInput = SearchViewModel.SearchInput(searchItemListTrigger: searchTrigger)
        let searchOutput = searchViewModel.getSearchOutput(input: searchInput)
        
        //populate table view
        searchOutput.searchItems
            .bind(to: tableView.rx.items) { tableView, row, model in
                var item: CellConfigurator = ShimmerItemCellConfig.init(item: SearchCellViewModel())
                
                // check actual data exists or not, to hide shimmer cell
                if model.id != nil {
                    item = SearchItemCellConfig.init(item:model.asCellViewModel)
                }
                
                let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: IndexPath(row: row, section: 0))
                item.configure(cell: cell)
                
                return cell
            }.disposed(by: disposeBag)
        
        // detect error
        searchOutput.errorTracker.subscribe(onNext: {
            [weak self] error in
            
            guard let weakSelf = self, let error = error else {
                return 
            }
            
            print("\(String(describing: weakSelf.TAG)) -- bindViewModel() -- error  -- code = \(error.errorCode), message = \(error.errorMessage)")
        }).disposed(by: disposeBag)
    }
    
    private func onTapTableviewCell() {
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Movie.self))
            .bind { [weak self] indexPath, model in
                guard let weakSelf = self else {
                    return
                }
                
                weakSelf.tableView.deselectRow(at: indexPath, animated: true)
                print("\(weakSelf.TAG) -- onTapTableviewCell() -- Selected " + (model.originalTitle ?? "") + " at \(indexPath)")
                
                //navigate to profile view controller
                weakSelf.navigateToDetailsController(with: model)
            }
            .disposed(by: disposeBag)
    }
    
    @objc func didTapSearchButton(sender : AnyObject){
        showSearchDialog()
    }
    
    private func showSearchDialog() {
        let alertController = UIAlertController(title: "Search movie", message: "Enter movie name. Ex- The \n Enter releasing year. Ex- 2000", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Movie name"
        }
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Releasing year"
        }
        
        let saveAction = UIAlertAction(title: "Search", style: UIAlertAction.Style.default, handler: { [weak self] alert -> Void in
            let name = (alertController.textFields?[0])?.text ?? ""
            let year = (alertController.textFields?[1])?.text ?? ""
            
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
        searchTrigger.onNext(SearchViewModel.SearchInputModel(query: name, year: year))
    }
    
    private func navigateToDetailsController(with movie: Movie) {
        (view.window?.windowScene?.delegate as! SceneDelegate).rootCoordinator.showDetailsController(movie: movie)
    }
}

