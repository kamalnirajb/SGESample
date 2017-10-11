//
//	SGECoreMessage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class SGECoreMessage : NSManagedObject{

	@NSManaged var id : String!
	@NSManaged var message : String!
	@NSManaged var note : String!
	@NSManaged var workHistoryDate : String!
	@NSManaged var workOrderDate : String!
	@NSManaged var workOrderId : String!
	@NSManaged var workRequestNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any], context: NSManagedObjectContext)	{
        
		let entity = NSEntityDescription.entity(forEntityName: "SGEMessages", in: context)!
		super.init(entity: entity, insertInto: context)
        
        if let idValue = dictionary["id"] as? String{
			id = idValue
		}
		if let messageValue = dictionary["message"] as? String{
			message = messageValue
		}
		if let noteValue = dictionary["note"] as? String{
			note = noteValue
		}
		if let workHistoryDateValue = dictionary["work_history_date"] as? String{
			workHistoryDate = workHistoryDateValue
		}
		if let workOrderDateValue = dictionary["work_order_date"] as? String{
			workOrderDate = workOrderDateValue
		}
		if let workOrderIdValue = dictionary["work_order_id"] as? String{
			workOrderId = workOrderIdValue
		}
		if let workRequestNumberValue = dictionary["work_request_number"] as? String{
			workRequestNumber = workRequestNumberValue
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		
		if id != nil{
			dictionary["id"] = id
		}
		if message != nil{
			dictionary["message"] = message
		}
		if note != nil{
			dictionary["note"] = note
		}
		if workHistoryDate != nil{
			dictionary["work_history_date"] = workHistoryDate
		}
		if workOrderDate != nil{
			dictionary["work_order_date"] = workOrderDate
		}
		if workOrderId != nil{
			dictionary["work_order_id"] = workOrderId
		}
		if workRequestNumber != nil{
			dictionary["work_request_number"] = workRequestNumber
		}
		return dictionary
	}

}
