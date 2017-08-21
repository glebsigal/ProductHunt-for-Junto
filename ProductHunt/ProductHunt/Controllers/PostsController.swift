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
        self.navigationController?.navigationBar.setBottomBorderColor(color: UIColor.lightText, height: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.85, green:0.06, blue:0.16, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white,
             NSFontAttributeName: UIFont(name: "SFUIDisplay-Semibold", size: 18)!]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.refreshControl?.addTarget(self, action: #selector(self.handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        self.getFeed()
        
        for fontFamilyName in UIFont.familyNames{
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName){
                print("Family: \(fontFamilyName)     Font: \(fontName)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = category.uppercased()
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
        cell.name.text = self.posts!.posts![indexPath.section].name
        cell.preview.text = self.posts!.posts![indexPath.section].tagline
        cell.upVotes.text = self.posts!.posts![indexPath.section].votesCount?.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 25
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.cornerRadius = 20
                cell.clipsToBounds = true
            })
        })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toProductController", sender: self)
    }
    
    func getFeed () {
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
