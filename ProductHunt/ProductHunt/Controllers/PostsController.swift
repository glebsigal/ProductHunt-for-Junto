//
//  PostsController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit
import SDWebImage

class PostsController: UITableViewController, ChooseCategoryProtocol {

    private var apiRouter = ApiRouter()
    private var posts: Posts?
    var slug = "tech"
    var category = "Tech"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.refreshControl?.addTarget(self, action: #selector(self.handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        self.getFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addTitleTapGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts?.posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        cell.thumbnail.sd_setImage(with: URL(string: self.posts!.posts![indexPath.section].thumbnail!.imageUrl!)) { (image, _, _, _) in
            if image != nil {
                cell.thumbnail.layer.cornerRadius = cell.thumbnail.frame.width / 2
                cell.thumbnail.clipsToBounds = true
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func getFeed () {
        self.title = category
        apiRouter.getPosts(slug: slug) { (posts, error) in
            if error == nil {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.getFeed()
        self.refreshControl?.endRefreshing()
    }
    
    func addTitleTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.openCategoriesController))
        self.navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }
    
    func openCategoriesController() {
        self.performSegue(withIdentifier: "toCategoriesController", sender: self)
    }
    
    func setCategory(name:String, slug:String) {
        self.category = name
        self.slug = slug
        self.getFeed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationBar.gestureRecognizers?.removeAll()
        if let vc = segue.destination as? CategoriesController {
            vc.delegate = self
        }
    }
}
