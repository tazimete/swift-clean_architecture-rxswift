//
//  DetailsViewController.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: BaseViewController {
    public var searchViewModel: AbstractSearchViewModel!
    private let disposeBag = DisposeBag()
    private let searchTrigger = PublishSubject<Void>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        super.initView()
    }
    
    override func initNavigationBar() {
        self.navigationItem.title = "Details"
    }
    
    override func bindViewModel() {
        
    }
}
