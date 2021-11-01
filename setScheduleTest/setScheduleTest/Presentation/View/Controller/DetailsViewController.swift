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
    @IBOutlet weak var uivInfoContainer: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleasingYear: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblOverviewTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        super.initView()
        startShimmerAnimation()
    }
    
    override func initNavigationBar() {
        self.navigationItem.title = "Details"
    }
    
    override func bindViewModel() {
        
    }
    
    public func startShimmerAnimation() -> Void {
       //shmmer skeleton animation
        ShimmerHelper.startShimmerAnimation(view: ivPoster)
        ShimmerHelper.startShimmerAnimation(view: lblVoteAverage)
        ShimmerHelper.startShimmerAnimation(view: lblTotalVote)
        ShimmerHelper.startShimmerAnimation(view: uivInfoContainer)
        ShimmerHelper.startShimmerAnimation(view: lblOverviewTitle)
        ShimmerHelper.startShimmerAnimation(view: lblOverview)
   }
       
   //stop shimmer animation
   public func stopShimmerAnimation() -> Void {
        ShimmerHelper.stopShimmerAnimation(view: lblVoteAverage)
        ShimmerHelper.stopShimmerAnimation(view: lblTotalVote)
        ShimmerHelper.stopShimmerAnimation(view: uivInfoContainer)
        ShimmerHelper.stopShimmerAnimation(view: lblOverviewTitle)
        ShimmerHelper.stopShimmerAnimation(view: lblOverview)
   }
}
