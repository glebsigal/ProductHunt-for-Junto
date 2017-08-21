//
//  ProductController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 21.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit
import SDWebImage

class ProductController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorHeadLine: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productText: UILabel!
    @IBOutlet weak var upvoteText: UILabel!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openUrl() {
        self.performSegue(withIdentifier: "toWebController", sender: self)
    }
    
    func fillData() {
        self.title = post.name?.uppercased()
        authorName.text = post.user?.name
        authorHeadLine.text = post.user?.headline
        authorImage.sd_setImage(with: URL(string: post.user!.imageUrl!.small!))
        authorImage.layer.cornerRadius = authorImage.frame.width / 2
        authorImage.clipsToBounds = true
        productName.text = post.name
        productText.text = post.tagline
        upvoteText.text = post.votesCount?.description
        productImage.sd_setImage(with: URL(string: post.screenshotUrl!.big!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebController" {
            if let vc = segue.destination as? WebController {
                vc.url = post.redirectUrl
                vc.title = self.title
            }
        }
    }
}
