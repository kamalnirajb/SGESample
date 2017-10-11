//
//  VCWorkHistory.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/11/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import UIKit
import CoreData
import SWActivityIndicatorView

class VCWorkHistory: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    // UI Controls
    @IBOutlet weak var workHistoryTV: UITableView!
    
    @IBOutlet weak var viewRequestBox: UIView!
    
    @IBOutlet weak var icnAttachment: UIImageView!
    
    @IBOutlet weak var lblCreateDate: UILabel!
    
    @IBOutlet weak var lblAssestName: UILabel!
    
    @IBOutlet weak var lblProblemDescription: UILabel!
    
    @IBOutlet weak var btnRequestStatus: UIButton!
    
    @IBOutlet weak var btnOrderStatus: UIButton!
    
    @IBOutlet weak var lblPreferredDateTwo: UILabel!
    @IBOutlet weak var lblPreferredDateOne: UILabel!
    
    // Variables
    var requestDetails:SWorkRequest? = nil
    var boxHeight:CGFloat = 0.0
    
    lazy var requestHistoryFetchController:NSFetchedResultsController = { () -> NSFetchedResultsController<SGECoreMessage> in
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchedRequest = NSFetchRequest<SGECoreMessage>(entityName: "SGEMessages")
        fetchedRequest.sortDescriptors = [NSSortDescriptor(key: "workRequestNumber", ascending: true)]
        let fetchRequestContoller = NSFetchedResultsController(
            fetchRequest: fetchedRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil)
        fetchRequestContoller.delegate = self
        return fetchRequestContoller
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workHistoryTV.rowHeight = UITableViewAutomaticDimension
        workHistoryTV.estimatedRowHeight = 170.0
        workHistoryTV.estimatedSectionHeaderHeight = boxHeight
        DispatchQueue.main.async {
            if let params:SWorkRequest = self.requestDetails {
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
        
        
        loadFromDb { (flag) in
            if flag {
                loadWorkHistory()
            }else {
                DispatchQueue.main.async {
                    self.workHistoryTV.reloadData()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWorkHistory() -> Void {
        let activityIndicatorView = SWActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        NetworkParams.sharedInstance.callWs(serviceKey: "workHistory", params: [
            "filename" : "mobile_requestor_dummy_history.json" as AnyObject
            ], successCallback: { (response) in
                activityIndicatorView.stopAnimating()
                CoreDataManager.shared.createHistoryRecord(workHistory: SGEWorkHistory.init(fromDictionary: response as! [String : Any]))
                self.loadFromDb(success: { (flag) in
                    if !flag {
                        DispatchQueue.main.async {
                            self.workHistoryTV.reloadData()
                        }
                    }
                })
        }) { (errorResponse) in
            print(errorResponse)
            activityIndicatorView.stopAnimating()
        }
    }
    
    func loadFromDb(success:(Bool)->Void) {
        if requestDetails != nil {
            DispatchQueue.global(qos: .background).sync {
                do {
                    self.requestHistoryFetchController.fetchRequest.predicate = NSPredicate(format: "workRequestNumber == %@", (self.requestDetails?.workRequestNumber)!)
                    try self.requestHistoryFetchController.performFetch()
                    if let count = self.requestHistoryFetchController.fetchedObjects?.count, count == 0 {
                        success(true)
                    }
                } catch {
                    print("An error occurred")
                }
                success(false)
            }
        }
        
    }
    
    // Mark: Tableview delegate
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 180.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WorkHistoryTVC = tableView.dequeueReusableCell(withIdentifier: "WorkHistoryTVC") as! WorkHistoryTVC
        cell.setData(message: requestHistoryFetchController.object(at: indexPath))
        return cell
    }
    
    // Mark: Tableview datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (requestHistoryFetchController.fetchedObjects?.count)! > 0 {
            return (requestHistoryFetchController.fetchedObjects?.count)!
        }
        return 0
    }
    
}
