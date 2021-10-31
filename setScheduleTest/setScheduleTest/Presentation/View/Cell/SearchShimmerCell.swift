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
        let gradient = SkeletonGradient(baseColor: UIColor.lightGray)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)

        lblTitle.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        lblOverview.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        ivPoster.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
    }
    
    func startShimmering() {
        containerView.layer.borderWidth = 0
        containerView.layer.borderColor = UIColor.clear.cgColor
        
        //shmmer skeleton animation
        let gradient = SkeletonGradient(baseColor: UIColor.lightGray)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)

        lblTitle.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        lblOverview.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
        ivPoster.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
    }
}
