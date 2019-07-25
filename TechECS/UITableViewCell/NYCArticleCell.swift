//
//  NYCArticleCell.swift
//  TechECS
//
//  Created by Ahmed Durrani on 25/07/2019.
//  Copyright © 2019 TeachEase solution. All rights reserved.
//

import UIKit

class NYCArticleCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(obj : DocsNYTIME) {
        lblTitle.text = obj.snippet
        lblDetail.text = obj.lead_paragraph
        lblDate.text = obj.pub_date

        
    }

    
}
