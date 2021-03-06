//
//  JFNewsOnePicCell.swift
//  BaoKanIOS
//
//  Created by jianfeng on 16/1/14.
//  Copyright © 2016年 六阿哥. All rights reserved.
//

import UIKit
import YYWebImage

class JFNewsOnePicCell: UITableViewCell {
    
    var postModel: JFArticleListModel? {
        didSet {
            iconView.image = nil
            iconView.yy_setImageWithURL(NSURL(string: postModel!.titlepic!), placeholder: UIImage(named: "placeholder_logo"))
            articleTitleLabel.text = postModel?.title!
            timeLabel.text = postModel?.newstime!.timeStampToString()
            befromLabel.text = postModel?.befrom!
            showNumLabel.text = postModel?.onclick!
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 图片宽度固定
        articleTitleLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 133
    }
    
    /**
     计算行高 - 暂时这个cell高度是固定的，所以这个方法不用
     */
    func getRowHeight(postModel: JFArticleListModel) -> CGFloat {
        self.postModel = postModel
        setNeedsLayout()
        layoutIfNeeded()
        return CGRectGetMaxY(timeLabel.frame) + 15
    }
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var befromLabel: UILabel!
    @IBOutlet weak var showNumLabel: UILabel!
    
}
