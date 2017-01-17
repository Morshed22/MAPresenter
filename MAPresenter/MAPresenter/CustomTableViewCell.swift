//
//  CustomTableViewCell.swift
//  MAPresenter
//
//  Created by Morshed Alam on 1/15/17.
//  Copyright © 2017 Morshed Alam. All rights reserved.
//

import UIKit
@IBDesignable
class CustomTableViewCell: UITableViewCell {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
       
    @IBOutlet weak var imageview: UIImageView!
        {
    didSet {
        
        imageview.layer.borderWidth = 1.0
        imageview.layer.masksToBounds = false
        imageview.layer.borderColor = UIColor.black.cgColor
        imageview.layer.cornerRadius = imageview.frame.size.width/2
        imageview.clipsToBounds = true
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
