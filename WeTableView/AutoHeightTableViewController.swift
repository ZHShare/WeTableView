//
//  AutoHeightTableViewController.swift
//  WeTableView
//
//  Created by 梦烙时光 on 2018/1/6.
//  Copyright © 2018年 StarHoa. All rights reserved.
//

import UIKit

struct AutoModel {
    let title: String
    let content: String
    
    static func models() -> [AutoModel] {
        return [
            AutoModel(title: "【渐冻症女博士病逝】", content: "【渐冻症女博士病逝】和病魔抗争两年的北大29岁渐冻症女博士娄滔因医治无效，于昨日凌晨在恩施咸丰老家离开人世。令人痛心的是，由于病情恶化后，娄滔身体出现感染，其器官不符合捐献条件，她捐献器官的遗愿也无法达成。"),
            AutoModel(title: "【渐冻症女博士病逝】", content: "　“一个人活着的意义，不能以生命长短作为标准，而应该以生命的质量和厚度来衡量……我走之后，能救命的部分尽管用，头部可留给医学做研究……”去年10月，娄滔的这份遗嘱感动全国网友。")]
    }
}

class AutoHeightTableViewController: UITableViewController
{
    
    fileprivate struct Identifier {
        static let cell = "Auto Height Cell"
    }
    
    var models = [AutoModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ________
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedSectionHeaderHeight = tableView.sectionHeaderHeight
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        models = AutoModel.models()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell, for: indexPath) as! AutoHeightTableViewCell
        cell.model = models[indexPath.row]
        return cell
    }
  
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = AutoHeightSectionHeader.nibView()
        sectionView.model = models[section]
        sectionView.displayIndex.text = "第\(section)组"
        return sectionView
    }

}
