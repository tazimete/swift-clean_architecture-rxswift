//
//  ViewController.swift
//  setScheduleTest
//
//  Created by JMC on 29/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIClient.shared.send(apiRequest: GithubApiRequest.fetchUserList(params: FetchGithubUserParam(since: 0)), type: [GithubUser].self).observe(on: MainScheduler.asyncInstance).subscribe(onNext: {
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

