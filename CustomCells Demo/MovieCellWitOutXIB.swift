//
//  MovieCellWitOutXIB.swift
//  CustomCells Demo
//
//  Created by Pawan kumar on 24/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieCellWitOutXIB: UITableViewCell {

    //Identifire
    static let identifire: String = "MovieCellWitOutXIB"
    
    var movie : Movie? {
        didSet {
            titleLabel.text = movie?.name
            subtitleLabel.text = movie?.details
            wasThisContentHelpfulLabel.text = "Was this content helpful ?"
        }
    }
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let subtitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //Was this content helpful ?
    private let wasThisContentHelpfulLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let likeButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "feedbackLike"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let dislikeButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "feedbackDisLike"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(wasThisContentHelpfulLabel)
        addSubview(likeButton)
        addSubview(dislikeButton)
        
        // Configure the view for the selected state
        self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
        self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
        
        //Title
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)
        
        //Subtitle
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)
        
        //Like Button
        //likeButton.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 45, width: 25, height: 25, enableInsets: false)
        //DisLike Button
        //dislikeButton.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: 25, height: 25, enableInsets: false)
        
        //Was This Content Help ful Label
        wasThisContentHelpfulLabel.anchor(top: subtitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)
        
        //Button Stack
        let stackView_Button = UIStackView(arrangedSubviews: [likeButton, dislikeButton])
        stackView_Button.distribution = .equalSpacing
        stackView_Button.axis = .horizontal
        stackView_Button.spacing = 10
        addSubview(stackView_Button)
        stackView_Button.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
        
        likeButton.addTarget(self, action: #selector(feedbackLikeButtonTap), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(feedbackDisLikeButtonTap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func feedbackLikeButtonTap() {
        print("feedbackLikeButtonTap")
    }
    
    @objc func feedbackDisLikeButtonTap() {
        print("feedbackDisLikeButtonTap")
    }
    
    func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {
        
        if button.imageView?.image != nil {
            let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
            button.setImage(image, for: .normal)
            button.tintColor = color
        }
    }
}
