//
//  ViewController.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/9/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import UIKit
import CoreData
import SWActivityIndicatorView


class VCWorkRequests: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    // UI Controls
    @IBOutlet weak var workRequestsTV: UITableView!
    
    var page:Int = 0
    // Variables
    lazy var requestFetchController:NSFetchedResultsController<SWorkRequest> = { () -> NSFetchedResultsController<SWorkRequest> in
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchedRequest = NSFetchRequest<SWorkRequest>(entityName: "SGERequests")
        fetchedRequest.sortDescriptors = [NSSortDescriptor(key: "assetName", ascending: true)]
        let fetchRequestContoller = NSFetchedResultsController(
            fetchRequest: fetchedRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil)
        fetchRequestContoller.delegate = self
        return fetchRequestContoller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Requests"
        workRequestsTV.rowHeight = UITableViewAutomaticDimension
        workRequestsTV.estimatedRowHeight = 170.0
        self.loadFromDb(page: page, success: { (flag) in
            if flag {
                loadRequestsFromServer()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadRequestsFromServer() {
        let activityIndicatorView = SWActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        NetworkParams.sharedInstance.callWs(serviceKey: "workRequest", params: [
            "filename" : "mobile_requestor_dummy_requests.json" as AnyObject
            ], successCallback: { (response) in
                activityIndicatorView.stopAnimating()
                CoreDataManager.shared.createRequestRecord(requests: SGEWorkRequests.init(fromDictionary: response as! [String : Any]))
                self.loadFromDb(page: self.page, success: { (flag) in
                    if !flag {
                        DispatchQueue.main.async {
                            self.workRequestsTV.reloadData()
                            self.page = self.page + 1
                        }
                    }
                })
        }) { (errorResponse) in
            print(errorResponse)
            activityIndicatorView.stopAnimating()
        }
    }
    
    func loadFromDb(page:Int, success:(Bool)->Void) {
        DispatchQueue.global(qos: .background).sync {
            do {
//                self.requestFetchController.fetchRequest.fetchLimit = 5
//                self.requestFetchController.fetchRequest.fetchOffset =  5 * page
                try self.requestFetchController.performFetch()
                if let count = self.requestFetchController.fetchedObjects?.count, count == 0 {
                    success(true)
                }else {
                    DispatchQueue.main.async {
                        self.workRequestsTV.reloadData()
                        self.page = self.page + 1
                    }
                }
            } catch {
                print("An error occurred")
            }
            success(false)
        }
    }
    
    // Mark: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (requestFetchController.fetchedObjects?.count)! > 0 {
            return (requestFetchController.fetchedObjects?.count)!
        }
        return 0
    }
    
    // Mark: TableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WorkRequestTVC = tableView.dequeueReusableCell(withIdentifier: "WorkRequestTVC") as! WorkRequestTVC
        cell.setData(params: requestFetchController.object(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc:VCWorkHistory = self.storyboard?.instantiateViewController(withIdentifier: "VCWorkHistory") as? VCWorkHistory {
            if let request:SWorkRequest = requestFetchController.object(at: indexPath) {
                vc.requestDetails = request
                vc.boxHeight = 10.0 + (tableView.cellForRow(at: indexPath)?.contentView.frame.height)!
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == (page * 5) - 1 {
//            loadFromDb(page: page, success: { (flag) in
//                if flag {
//                    page = 0
//                    loadRequestsFromServer()
//                }
//            })
//        }
//    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
}

