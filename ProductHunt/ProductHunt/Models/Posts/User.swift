//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class User : Mappable{

	var headline : String?
	var imageUrl : ImageUrl?
	var name : String?


	func mapping(map: Map)
	{
		headline <- map["headline"]
		imageUrl <- map["image_url"]
		name <- map["name"]
	}
    
    required init?(map: Map) {}
}
