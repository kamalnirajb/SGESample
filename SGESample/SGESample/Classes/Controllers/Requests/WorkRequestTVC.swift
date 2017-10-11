//
//  WorkRequestTVC.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/10/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import UIKit

class WorkRequestTVC: UITableViewCell {

    
    @IBOutlet weak var viewRequestBox: UIView!
    
    @IBOutlet weak var icnAttachment: UIImageView!
    
    @IBOutlet weak var lblCreateDate: UILabel!
    
    @IBOutlet weak var lblAssestName: UILabel!
    
    @IBOutlet weak var lblProblemDescription: UILabel!
    
    @IBOutlet weak var btnRequestStatus: UIButton!
    
    @IBOutlet weak var btnOrderStatus: UIButton!
    
    @IBOutlet weak var lblPreferredDateTwo: UILabel!
    @IBOutlet weak var lblPreferredDateOne: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(params:SWorkRequest) -> Void {
    
        DispatchQueue.main.async {
            self.viewRequestBox.layer.borderColor = UIColor.lightGray.cgColor
            self.icnAttachment.isHidden = params.attachments
            self.lblCreateDate.text = params.createdDate
            self.lblAssestName.text = params.assetName
            self.lblProblemDescription.text = params.problemDescription
            self.lblPreferredDateOne.text = params.preferredDate1
            self.lblPreferredDateTwo.text = params.preferredDate2
            self.btnOrderStatus.setTitle(params.workOrderStatus, for: .normal)
            self.btnRequestStatus.setTitle(params.workRequestStatus, for: .normal)
        }
    }

}
