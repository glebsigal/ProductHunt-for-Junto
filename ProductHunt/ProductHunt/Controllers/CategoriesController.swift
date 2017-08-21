//
//  CategoriesController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit

// -----------> Protocol for returning category's values to FeedController <-----------
protocol ChooseCategoryProtocol: class {
    func setCategory (name: String, slug: String)
}

class CategoriesController: UITableViewController {

    private var apiRouter = ApiRouter()
    var categories: [Category]?
    weak var delegate: ChooseCategoryProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = self.categories![indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setCategory(name: categories![indexPath.row].name!,
                                  slug: categories![indexPath.row].slug!)
        self.navigationController?.popViewController(animated: true)
    }
}
