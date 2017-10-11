//
//	SGEWorkRequests.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SGEWorkRequests : NSObject, NSCoding{

	var workRequests : [SGEWorkRequest]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workRequests = [SGEWorkRequest]()
		if let workRequestsArray = dictionary["work_requests"] as? [[String:Any]]{
			for dic in workRequestsArray{
				let value = SGEWorkRequest(fromDictionary: dic)
				workRequests.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if workRequests != nil{
			var dictionaryElements = [[String:Any]]()
			for workRequestsElement in workRequests {
				dictionaryElements.append(workRequestsElement.toDictionary())
			}
			dictionary["work_requests"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         workRequests = aDecoder.decodeObject(forKey :"work_requests") as? [SGEWorkRequest]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workRequests != nil{
			aCoder.encode(workRequests, forKey: "work_requests")
		}

	}

}