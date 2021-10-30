//
//  SearchItemCell.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import UIKit


class SearchItemCell : UITableViewCell, ConfigurableCell {
    typealias DataType = AbstractCellViewModel
    
    internal var imageUrlAtCurrentIndex: String?
    
    internal let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isSkeletonable = true
        return view
    }()
    
    internal let lblUsername : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.isSkeletonable = true
        lbl.skeletonLineSpacing = 10
        lbl.multilineSpacing = 10
        return lbl
    }()
    
    internal let lblDescription : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.isSkeletonable = true
        lbl.skeletonLineSpacing = 10
        lbl.multilineSpacing = 10
        return lbl
    }()
    
    internal let ivAvatar : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "img_avatar"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 45
        imgView.isSkeletonable = true
        return imgView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ivAvatar.image = nil
        lblUsername.text = ""
        lblDescription.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        
        addSubview(containerView)
        containerView.addSubview(ivAvatar)
        containerView.addSubview(lblUsername)
        containerView.addSubview(lblDescription)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.width, height: 0, enableInsets: false)
        ivAvatar.anchor(top: containerView.topAnchor, left:  containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 90, enableInsets: false)
        lblUsername.anchor(top: containerView.topAnchor, left: ivAvatar.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 15, width: frame.size.width-30, height: 0, enableInsets: false)
        lblDescription.anchor(top: lblUsername.bottomAnchor, left: ivAvatar.rightAnchor, bottom: ivAvatar.bottomAnchor, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 15, paddingRight: 15, width: frame.size.width-30, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(data: DataType) {
        ShimmerHelper.startShimmerAnimation(view: ivAvatar)
        
        imageUrlAtCurrentIndex = data.thumbnail
        lblUsername.text = data.title
        lblDescription.text = data.subtitle
//        containerView.backgroundColor = data.isSeen ?? false ? .lightGray : .white
        
        ivAvatar.loadImage(from: data.thumbnail ?? "", completionHandler: {
            [weak self] url, image, isCache in

            guard let weakSelf = self else {
                return
            }

            if (url).elementsEqual(weakSelf.imageUrlAtCurrentIndex ?? ""){
                weakSelf.ivAvatar.image = image
                ShimmerHelper.stopShimmerAnimation(view: weakSelf.ivAvatar)
            }
        })
        
        //apply  change theme
        applyTheme(data: data)
    }
    
    // when theme change
    public func applyTheme(data: DataType) {
        switch (traitCollection.userInterfaceStyle) {
            case .dark:
                containerView.backgroundColor = data.isSeen ?? false ? .lightGray : .black
                containerView.layer.borderColor = UIColor.white.cgColor
                lblUsername.textColor = .white
                lblDescription.textColor = .white
                backgroundView?.backgroundColor = .black
                break

            case .light:
                containerView.backgroundColor = data.isSeen ?? false ? .lightGray : .white
                containerView.layer.borderColor = UIColor.black.cgColor
                lblUsername.textColor = .black
                lblDescription.textColor = .darkGray
                break

            default:
                break
        }
    }
}
