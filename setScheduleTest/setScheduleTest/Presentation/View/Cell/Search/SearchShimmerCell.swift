//
//  ShimmerCell.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import UIKit

class SearchShimmerCell: SearchItemCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func configure(data: SearchShimmerCell.DataType) {
        containerView.layer.borderWidth = 0
        containerView.layer.borderColor = UIColor.clear.cgColor
        
        //shmmer skeleton animation
        ShimmerHelper.startShimmerAnimation(viewlist: [lblTitle, lblOverview, ivPoster])
    }
    
    func startShimmering() {
        containerView.layer.borderWidth = 0
        containerView.layer.borderColor = UIColor.clear.cgColor
        
        //shmmer skeleton animation
        ShimmerHelper.startShimmerAnimation(viewlist: [lblTitle, lblOverview, ivPoster])
    }
}
