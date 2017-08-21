//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Thumbnail : Mappable{

	var id : Int?
	var imageUrl : String?

	func mapping(map: Map)
	{
		id <- map["id"]
		imageUrl <- map["image_url"]
	}
    
    required init?(map: Map) {}
}
