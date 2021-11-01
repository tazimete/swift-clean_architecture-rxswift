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
    public var movieViewModel: AbstractMovieViewModel!
    private let disposeBag = DisposeBag()
    private let movieDetailsTrigger = PublishSubject<Void>()
    
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
        movieViewModel = (viewModel as? AbstractMovieViewModel) ?? MovieViewModel()
        let movieInput = MovieViewModel.MovieInput(movieDetailsTrigger: movieDetailsTrigger)
        let movieOutput = movieViewModel.getMovieOutput(input: movieInput)
        
        //receive response and populate UI
        movieOutput.movieDetails
            .subscribe(onNext: { [weak self] response in
                guard let weakSelf = self, let response = response else {
                    return
                }
                
                debugPrint("\(weakSelf.TAG) -- bindViewModel() -- response = \(response)")
            }).disposed(by: disposeBag)
        
        // detect error and show error message
        movieOutput.errorTracker.subscribe(onNext: {
            [weak self] error in
            
            guard let weakSelf = self, let error = error else {
                return
            }
            
            print("\(String(describing: weakSelf.TAG)) -- bindViewModel() -- error  -- code = \(error.errorCode), message = \(error.errorMessage)")
        }).disposed(by: disposeBag)
        
        triggerFetcingMovieDetails()
    }
    
    public func triggerFetcingMovieDetails() {
        movieDetailsTrigger.onNext(())
    }
    
    public func startShimmerAnimation() -> Void {
       //shmmer skeleton animation
        startShimmerAnimation(views: [ivPoster, lblVoteAverage, lblTotalVote, uivInfoContainer, lblOverviewTitle, lblOverview])
   }
       
   //stop shimmer animation
   public func stopShimmerAnimation() -> Void {
        stopShimmerAnimation(views: [ivPoster, lblVoteAverage, lblTotalVote, uivInfoContainer, lblOverviewTitle, lblOverview])
   }
}
