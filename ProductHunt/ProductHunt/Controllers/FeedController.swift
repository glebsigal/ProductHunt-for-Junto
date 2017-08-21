//
//  PostsController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class FeedController: UITableViewController, ChooseCategoryProtocol {

    private var apiRouter = ApiRouter()
    private var posts: [Post]?
    private var choosenPost: Post?
    private var categories: [Category]?
    var slug = "tech"
    var category = "Tech"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.getFeed()
        self.getCategories()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = category.uppercased()
        self.addTitleTapGesture()
    }

    // -----------> Init navigation bar UI and tableView's refreshControl <-----------

    func initUI() {
        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.85, green:0.06, blue:0.16, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white,
             NSFontAttributeName: UIFont(name: "SFUIDisplay-Semibold", size: 18)!]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.refreshControl?.addTarget(self,
                                       action: #selector(self.handleRefresh(refreshControl:)),
                                       for: UIControlEvents.valueChanged)
    }

    // -----------> END of Init navigation bar UI and tableView's refreshControl <-----------

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
        let postUrl = self.posts![indexPath.section].thumbnail!.imageUrl!
        cell.thumbnail.sd_setImage(with: URL(string: postUrl)) { (image, _, _, _) in
            if image != nil {
                cell.thumbnail.layer.cornerRadius = cell.thumbnail.frame.width / 2
                cell.thumbnail.clipsToBounds = true
            }
        }
        cell.name.text = self.posts![indexPath.section].name
        cell.preview.text = self.posts![indexPath.section].tagline
        cell.upVotes.text = self.posts![indexPath.section].votesCount?.description
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 25
        } else {
            return 1
        }
    }

    // -----------> Method for animate tableview's cells <-----------

    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.cornerRadius = 20
                cell.clipsToBounds = true
            })
        })
    }

    // -----------> END of Method for animate tableview's cells and tableView Data Source <-----------

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.choosenPost = self.posts![indexPath.section]
        self.performSegue(withIdentifier: "toProductController", sender: self)
    }

    // MARK: - API workers

    func getFeed () {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        apiRouter.getPosts(slug: slug) { (posts, _) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if posts != nil {
                self.posts = posts!.posts
                self.tableView.reloadData()
            }
        }
    }

    func getCategories () {
        apiRouter.getCategories { (categories, _) in
            if categories != nil {
                self.categories = categories!.categories
            }
        }
    }

    // -----------> END of API workers  <-----------

    // MARK: - RefreshControl methods and implementation categories protocol methods

    func handleRefresh(refreshControl: UIRefreshControl) {
        self.getFeed()
        self.getCategories()
        self.refreshControl?.endRefreshing()
    }

    func addTitleTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.openCategoriesController))
        self.navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }

    func openCategoriesController() {
        self.performSegue(withIdentifier: "toCategoriesController", sender: self)
    }

    func setCategory(name: String, slug: String) {
        if self.slug != slug {
        self.category = name
        self.slug = slug
        self.getFeed()
        }
    }
    // -----------> END of RefreshControl methods and implementation categories protocol methods  <-----------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationBar.gestureRecognizers?.removeAll()
        if segue.identifier == "toProductController" {
            if let vc = segue.destination as? PostController {
                vc.post = choosenPost
            }
        } else {
            if let vc = segue.destination as? CategoriesController {
                vc.delegate = self
                vc.categories = self.categories
            }
        }
    }
}
