//
//	SGEWorkRequest.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SGEWorkRequest : NSObject, NSCoding{

	var assetName : String!
	var attachments : Bool!
	var createdDate : String!
	var preferredDate1 : String!
	var preferredDate2 : String!
	var problemDescription : String!
	var workOrderStatus : String!
	var workRequestNumber : String!
	var workRequestStatus : String!
	var workRequestType : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		assetName = dictionary["asset_name"] as? String
		attachments = "TRUE".compare(dictionary["attachments"] as! String) == .orderedSame
		createdDate = dictionary["created_date"] as? String
		preferredDate1 = dictionary["preferred_date_1"] as? String
		preferredDate2 = dictionary["preferred_date_2"] as? String
		problemDescription = dictionary["problem_description"] as? String
		workOrderStatus = dictionary["work_order_status"] as? String
		workRequestNumber = dictionary["work_request_number"] as? String
		workRequestStatus = dictionary["work_request_status"] as? String
		workRequestType = dictionary["work_request_type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if assetName != nil{
			dictionary["asset_name"] = assetName
		}
		if attachments != nil{
			dictionary["attachments"] = attachments
		}
		if createdDate != nil{
			dictionary["created_date"] = createdDate
		}
		if preferredDate1 != nil{
			dictionary["preferred_date_1"] = preferredDate1
		}
		if preferredDate2 != nil{
			dictionary["preferred_date_2"] = preferredDate2
		}
		if problemDescription != nil{
			dictionary["problem_description"] = problemDescription
		}
		if workOrderStatus != nil{
			dictionary["work_order_status"] = workOrderStatus
		}
		if workRequestNumber != nil{
			dictionary["work_request_number"] = workRequestNumber
		}
		if workRequestStatus != nil{
			dictionary["work_request_status"] = workRequestStatus
		}
		if workRequestType != nil{
			dictionary["work_request_type"] = workRequestType
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         assetName = aDecoder.decodeObject(forKey: "asset_name") as? String
         attachments = aDecoder.decodeObject(forKey: "attachments") as? Bool
         createdDate = aDecoder.decodeObject(forKey: "created_date") as? String
         preferredDate1 = aDecoder.decodeObject(forKey: "preferred_date_1") as? String
         preferredDate2 = aDecoder.decodeObject(forKey: "preferred_date_2") as? String
         problemDescription = aDecoder.decodeObject(forKey: "problem_description") as? String
         workOrderStatus = aDecoder.decodeObject(forKey: "work_order_status") as? String
         workRequestNumber = aDecoder.decodeObject(forKey: "work_request_number") as? String
         workRequestStatus = aDecoder.decodeObject(forKey: "work_request_status") as? String
         workRequestType = aDecoder.decodeObject(forKey: "work_request_type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if assetName != nil{
			aCoder.encode(assetName, forKey: "asset_name")
		}
		if attachments != nil{
			aCoder.encode(attachments, forKey: "attachments")
		}
		if createdDate != nil{
			aCoder.encode(createdDate, forKey: "created_date")
		}
		if preferredDate1 != nil{
			aCoder.encode(preferredDate1, forKey: "preferred_date_1")
		}
		if preferredDate2 != nil{
			aCoder.encode(preferredDate2, forKey: "preferred_date_2")
		}
		if problemDescription != nil{
			aCoder.encode(problemDescription, forKey: "problem_description")
		}
		if workOrderStatus != nil{
			aCoder.encode(workOrderStatus, forKey: "work_order_status")
		}
		if workRequestNumber != nil{
			aCoder.encode(workRequestNumber, forKey: "work_request_number")
		}
		if workRequestStatus != nil{
			aCoder.encode(workRequestStatus, forKey: "work_request_status")
		}
		if workRequestType != nil{
			aCoder.encode(workRequestType, forKey: "work_request_type")
		}

	}

}
