//
//  MainTableViewController.swift
//  WeTableView
//
//  Created by 梦烙时光 on 2018/1/6.
//  Copyright © 2018年 StarHoa. All rights reserved.
//

import UIKit

struct MainModel {
    
    fileprivate struct Identifier {
        static let autoHeightSegue = "Auto Height"
    }
    
    let title: String
    let identifier: String
    
    static func models() -> [MainModel] {
        return [MainModel(title: "自适应高度", identifier: Identifier.autoHeightSegue)]
    }
}

class MainTableViewController: UITableViewController
{
    fileprivate struct Identifier {
        
        static let normalCell = "Main Cell"
    }
    
    var models = [MainModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models = MainModel.models()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.normalCell, for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: models[indexPath.row].identifier, sender: tableView)
    }
    
}
