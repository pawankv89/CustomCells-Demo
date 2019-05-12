//
//  MovieCell.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    //Title
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    //Button
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    //Identifire
    static let identifire: String = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Configure the view for the selected state
        self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
        self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
 
    func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {
        
        if button.imageView?.image != nil {
            let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
            button.setImage(image, for: .normal)
            button.tintColor = color
        }
    }
}


