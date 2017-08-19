//
//  PostsController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit

class PostsController: UITableViewController {

    private var apiRouter = ApiRouter()
    private var posts: Posts?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        cell.textLabel?.text = posts?.posts?[indexPath.row].name
        return cell
    }
    
    func getFeed () {
        apiRouter.getPosts { (posts, error) in
            if error == nil {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
    
    func addTitleTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.openCategoriesController))
        self.navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }
    
    func openCategoriesController() {
        self.performSegue(withIdentifier: "toCategoriesController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationBar.gestureRecognizers?.removeAll()
    }
}
