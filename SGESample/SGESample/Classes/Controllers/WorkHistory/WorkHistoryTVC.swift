//
//  WorkHistoryTVC.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/11/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import UIKit

class WorkHistoryTVC: UITableViewCell {

    @IBOutlet weak var viewRequestBox: UIView!
    
    @IBOutlet weak var lblOrderId: UILabel!
    
    @IBOutlet weak var lblHistoryDate: UILabel!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var lblNotes: UILabel!
    
    @IBOutlet weak var lblOrderDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(message: SGECoreMessage) -> Void {
        DispatchQueue.main.async {
            self.viewRequestBox.layer.borderColor = UIColor.lightGray.cgColor
            self.lblOrderId.text = message.workOrderId
            self.lblHistoryDate.text = message.workHistoryDate
            if let message:String = message.message, message.compare("NULL") != .orderedSame {
                self.lblMessage.text = message
            }else {
                self.lblMessage.text = ""
            }
            if let note:String = message.note, note.compare("NULL") != .orderedSame {
                self.lblNotes.text = note
            }else{
                self.lblNotes.text = ""
            }
            self.lblOrderDate.text = message.workOrderDate
        }
    }
}
