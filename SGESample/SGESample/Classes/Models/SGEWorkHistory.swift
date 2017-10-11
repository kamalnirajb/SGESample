//
//	SGEWorkHistory.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SGEWorkHistory : NSObject, NSCoding{
    
    var messages : [SGEMessage]!
    var workHistory : SGEWorkHistory!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        messages = [SGEMessage]()
        if let workHistoryData = dictionary["work_history"] as? [String:Any]{
            for (key, _) in workHistoryData {
                if let messagesArray = (workHistoryData[key] as! [String:Any])["messages"] as? [[String:Any]]{
                    for dic in messagesArray{
                        let value = SGEMessage(fromDictionary: dic)
                        messages.append(value)
                    }
                }
            }
            workHistory = SGEWorkHistory(fromDictionary: workHistoryData)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if messages != nil{
            var dictionaryElements = [[String:Any]]()
            for messagesElement in messages {
                dictionaryElements.append(messagesElement.toDictionary())
            }
            dictionary["messages"] = dictionaryElements
        }
        if workHistory != nil{
            dictionary["work_history"] = workHistory.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        messages = aDecoder.decodeObject(forKey :"messages") as? [SGEMessage]
        workHistory = aDecoder.decodeObject(forKey: "work_history") as? SGEWorkHistory
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if messages != nil{
            aCoder.encode(messages, forKey: "messages")
        }
        if workHistory != nil{
            aCoder.encode(workHistory, forKey: "work_history")
        }
        
    }
    
}
