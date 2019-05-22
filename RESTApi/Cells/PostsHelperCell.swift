//
//  ImageCollectionViewCell.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import SwiftyVK
import SwiftyJSON

class PostsHelperCell: UITableViewCell {
    
    @IBOutlet weak var imageViewRow: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    
    override func prepareForReuse() {
        imageViewRow.image = nil
        postTextLabel.text = nil
    }
    
    func setupRow(post: Post) {
        if let url = URL(string: post.imageUrl) {
            imageViewRow.af_setImage(withURL: url)
        }
        postTextLabel.text = post.text
    }
    
}
