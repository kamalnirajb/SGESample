//
//  CoreDataManager.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/10/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    
    func createRequestRecord(requests:SGEWorkRequests) {
        DispatchQueue.global(qos: .background).sync {
            let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
            for request in requests.workRequests {
                print(request)
                if let requestEntity = NSEntityDescription.insertNewObject(forEntityName: "SGERequests", into: delegate.persistentContainer.viewContext) as? SGERequests {
                    requestEntity.assetName = request.assetName
                    requestEntity.attachments = request.attachments
                    requestEntity.createdDate = request.createdDate
                    requestEntity.problemDescription = request.problemDescription
                    requestEntity.preferredDate1 = request.preferredDate1
                    requestEntity.preferredDate2 = request.preferredDate2
                    requestEntity.workOrderStatus = request.workOrderStatus
                    requestEntity.workRequestStatus = request.workRequestStatus
                    requestEntity.workRequestType = request.workRequestType
                    requestEntity.workRequestNumber = request.workRequestNumber
                    do {
                        if requestEntity.isInserted {
                            context.refresh(requestEntity, mergeChanges: true)
                        }else {
                            try context.save()
                        }
                        
                    }  catch let error {
                        print("Exception in request saving", error)
                    }
                }
            }
        }
    }
    
    func createHistoryRecord(workHistory:SGEWorkHistory) {
        DispatchQueue.global(qos: .background).sync {
            let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
            for message in workHistory.messages {
                print(message)
                if let messageEntity = NSEntityDescription.insertNewObject(forEntityName: "SGEMessages", into: delegate.persistentContainer.viewContext) as? SGEMessages {
                    messageEntity.id = message.id
                    messageEntity.message = message.message
                    messageEntity.note = message.note
                    messageEntity.workHistoryDate = message.workHistoryDate
                    messageEntity.workOrderDate = message.workOrderDate
                    messageEntity.workOrderId = message.workOrderId
                    messageEntity.workRequestNumber = message.workRequestNumber
                    
                    do {
                        if messageEntity.isInserted {
                            context.refresh(messageEntity, mergeChanges: true)
                        }else {
                            try context.save()
                        }
                        
                    } catch let error {
                        print("Exception in history saving", error)
                    }
                }
            }
        }
    }
}
