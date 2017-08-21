//
//  CategoriesController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit

protocol ChooseCategoryProtocol {
    func setCategory (name:String, slug:String)
}

class CategoriesController: UITableViewController {

    private var apiRouter = ApiRouter()
    var categories: Categories?
    var delegate : ChooseCategoryProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.categories?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories?.categories?[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.setCategory(name: categories!.categories![indexPath.row].name!,
                             slug: categories!.categories![indexPath.row].slug!)
        self.navigationController?.popViewController(animated: true)
    }
}
