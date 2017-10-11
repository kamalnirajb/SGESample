//
//	SGEMessage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SGEMessage : NSObject, NSCoding{

	var id : String!
	var message : String!
	var note : String!
	var workHistoryDate : String!
	var workOrderDate : String!
	var workOrderId : String!
	var workRequestNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? String
		message = dictionary["message"] as? String
		note = dictionary["note"] as? String
		workHistoryDate = dictionary["work_history_date"] as? String
		workOrderDate = dictionary["work_order_date"] as? String
		workOrderId = dictionary["work_order_id"] as? String
		workRequestNumber = dictionary["work_request_number"] as? String
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

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? String
         message = aDecoder.decodeObject(forKey: "message") as? String
         note = aDecoder.decodeObject(forKey: "note") as? String
         workHistoryDate = aDecoder.decodeObject(forKey: "work_history_date") as? String
         workOrderDate = aDecoder.decodeObject(forKey: "work_order_date") as? String
         workOrderId = aDecoder.decodeObject(forKey: "work_order_id") as? String
         workRequestNumber = aDecoder.decodeObject(forKey: "work_request_number") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if note != nil{
			aCoder.encode(note, forKey: "note")
		}
		if workHistoryDate != nil{
			aCoder.encode(workHistoryDate, forKey: "work_history_date")
		}
		if workOrderDate != nil{
			aCoder.encode(workOrderDate, forKey: "work_order_date")
		}
		if workOrderId != nil{
			aCoder.encode(workOrderId, forKey: "work_order_id")
		}
		if workRequestNumber != nil{
			aCoder.encode(workRequestNumber, forKey: "work_request_number")
		}

	}

}