//
//  ProductController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 21.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit
import SDWebImage

class PostController: UIViewController {

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
    }

    @IBAction func openUrl() {
        self.performSegue(withIdentifier: "toWebController", sender: self)
    }

    // -----------> Connect current post values for IBOutlets <-----------

    func fillData() {
        self.title = post.name?.uppercased()
        authorName.text = post.user?.name
        authorHeadLine.text = post.user?.headline
        self.setImage(imageView: authorImage, url: post.user!.imageUrl!.small!, needCrop: false)
        authorImage.layer.cornerRadius = authorImage.frame.width / 2
        authorImage.clipsToBounds = true
        productName.text = post.name
        productText.text = post.tagline
        upvoteText.text = post.votesCount?.description
        self.setImage(imageView: productImage, url: post.screenshotUrl!.big!, needCrop: true)
    }

    //  -----------> Set image for screenshot outlet <-----------

    func setImage(imageView: UIImageView, url: String, needCrop: Bool) {
        imageView.sd_setImage(with: URL(string: url)) { (image, _, _, _) in
            if image != nil && needCrop {
               imageView.image = self.cropImage(image: imageView.image!,
                                                toRect: CGRect(x: 0, y: 0, width: 800, height: 425))
            }
        }
    }

    func cropImage(image: UIImage, toRect rect: CGRect) -> UIImage {
        let imageRef: CGImage = image.cgImage!.cropping(to: rect)!
        let croppedImage: UIImage = UIImage(cgImage:imageRef)
        return croppedImage
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebController" {
            if let vc = segue.destination as? WebController {
                vc.redirectUrl = post.redirectUrl
                vc.title = self.title
            }
        }
    }
}
