//
//	ImageUrl.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ImageUrl : Mappable {

	var small : String?
	var original : String?

	func mapping(map: Map)
	{
		small <- map["100px"]
		original <- map["original"]
		
	}
    
    required init?(map: Map) {}
}
