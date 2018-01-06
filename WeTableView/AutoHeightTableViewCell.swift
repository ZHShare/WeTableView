//
//  AutoHeightTableViewCell.swift
//  WeTableView
//
//  Created by 梦烙时光 on 2018/1/6.
//  Copyright © 2018年 StarHoa. All rights reserved.
//

import UIKit

class AutoHeightTableViewCell: UITableViewCell
{

    @IBOutlet var icon: UIImageView!
    @IBOutlet var displayTitle: UILabel!
    @IBOutlet var displayContent: UILabel!
    
    var model: AutoModel? {
        didSet { updateUI() }
    }

    fileprivate func updateUI() {
        
        displayTitle.text = model?.title
        displayContent.text = model?.content
    }
}
