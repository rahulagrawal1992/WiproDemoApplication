//
//	Record.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import Foundation

struct Record{

	var descriptionField : String!
	var imageHref : String!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		descriptionField = dictionary["description"] as? String
		imageHref = dictionary["imageHref"] as? String
		title = dictionary["title"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if imageHref != nil{
			dictionary["imageHref"] = imageHref
		}
		if title != nil{
			dictionary["title"] = title
		}
		return dictionary
	}

}
