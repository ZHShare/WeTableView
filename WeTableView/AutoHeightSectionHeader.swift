//
//  AutoHeightSectionHeader.swift
//  WeTableView
//
//  Created by 梦烙时光 on 2018/1/8.
//  Copyright © 2018年 StarHoa. All rights reserved.
//

import UIKit

class AutoHeightSectionHeader: UIView
{

    @IBOutlet var displayTitle: UILabel!
    @IBOutlet var displayContent: UILabel!
    @IBOutlet var displayIndex: UILabel!
    
    var model: AutoModel! {
        didSet { updateUI() }
    }
    
    func updateUI() {
        
        displayTitle.text = model.title
        displayContent.text = model.content
    }
    
    
    static func nibView() -> AutoHeightSectionHeader {
        return view(type: AutoHeightSectionHeader.self)
    }
    
    static func view<T>(type: T.Type = T.self) -> T {
        
        let nibNamed = String(describing: type)
        let tv = UINib(nibName: nibNamed, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? T
        if let tv = tv { return tv}
        fatalError("can nnot load nib of \(type)")
    }
}
