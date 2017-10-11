//
//	SWorkRequest.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class SWorkRequest : NSManagedObject{

	@NSManaged var sWorkRequest : SWorkRequest!
	@NSManaged var assetName : String!
	@NSManaged var attachments : Bool
	@NSManaged var createdDate : String!
	@NSManaged var preferredDate1 : String!
	@NSManaged var preferredDate2 : String!
	@NSManaged var problemDescription : String!
	@NSManaged var workOrderStatus : String!
	@NSManaged var workRequestNumber : String!
	@NSManaged var workRequestStatus : String!
	@NSManaged var workRequestType : String!
	@NSManaged var workRequests : NSMutableSet!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any], context: NSManagedObjectContext)	{
		let entity = NSEntityDescription.entity(forEntityName: "SWorkRequest", in: context)!
		super.init(entity: entity, insertInto: context)
		if let sWorkRequestData = dictionary["sWorkRequest"] as? [String:Any]{
			sWorkRequest = SWorkRequest(fromDictionary: sWorkRequestData, context:context)
		}
		if let assetNameValue = dictionary["asset_name"] as? String{
			assetName = assetNameValue
		}
		if let attachmentsValue = dictionary["attachments"] as? Bool{
			attachments = attachmentsValue
		}
		if let createdDateValue = dictionary["created_date"] as? String{
			createdDate = createdDateValue
		}
		if let preferredDate1Value = dictionary["preferred_date_1"] as? String{
			preferredDate1 = preferredDate1Value
		}
		if let preferredDate2Value = dictionary["preferred_date_2"] as? String{
			preferredDate2 = preferredDate2Value
		}
		if let problemDescriptionValue = dictionary["problem_description"] as? String{
			problemDescription = problemDescriptionValue
		}
		if let workOrderStatusValue = dictionary["work_order_status"] as? String{
			workOrderStatus = workOrderStatusValue
		}
		if let workRequestNumberValue = dictionary["work_request_number"] as? String{
			workRequestNumber = workRequestNumberValue
		}
		if let workRequestStatusValue = dictionary["work_request_status"] as? String{
			workRequestStatus = workRequestStatusValue
		}
		if let workRequestTypeValue = dictionary["work_request_type"] as? String{
			workRequestType = workRequestTypeValue
		}
		if let workRequestsArray = dictionary["work_requests"] as? [[String:Any]]{
			let workRequestsSet = NSMutableSet()
			for dic in workRequestsArray{
				let value = SWorkRequest(fromDictionary: dic, context:context)
				workRequestsSet.add(value)
			}
			workRequests = workRequestsSet
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if sWorkRequest != nil{
			dictionary["sWorkRequest"] = sWorkRequest.toDictionary()
		}
		if assetName != nil{
			dictionary["asset_name"] = assetName
		}
		dictionary["attachments"] = attachments
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
		if workRequests != nil{
			var dictionaryElements = [[String:Any]]()
			for workRequestsElement in workRequests {
				dictionaryElements.append((workRequestsElement as AnyObject).toDictionary())
			}
			dictionary["work_requests"] = dictionaryElements
		}
		return dictionary
	}

}
