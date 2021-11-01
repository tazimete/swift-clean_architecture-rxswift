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
    // MARK: Non UI Objects
    public var searchViewModel: AbstractSearchViewModel!
    private let disposeBag = DisposeBag()
    private let searchTrigger = PublishSubject<Void>()
    
    // MARK: UI Objects
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblTotalVote: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleasingYear: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    
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
