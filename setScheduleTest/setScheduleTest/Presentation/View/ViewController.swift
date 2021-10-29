//
//  ViewController.swift
//  setScheduleTest
//
//  Created by JMC on 29/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIClient.shared.send(apiRequest: GithubApiRequest.fetchUserList(params: FetchGithubUserParam(since: 0)), type: [GithubUser].self).observe(on: MainScheduler.asyncInstance).subscribe(onNext: {
            result in
            
            switch (result) {
                case .success(let data):
                    data.subscribe(onNext: {
                        response in
                        print("response = \(response.count)")
                    })
                    
                case .failure(let error): break
            }
            
        } , onError: nil, onCompleted: nil, onDisposed: nil)
    }


}

