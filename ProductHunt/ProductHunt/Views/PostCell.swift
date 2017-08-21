//
//  PostCell.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 20.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit
import SDWebImage

class PostCell: UITableViewCell {

    @IBOutlet var thumbnail: FLAnimatedImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var preview: UILabel!
    @IBOutlet var upVotes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
