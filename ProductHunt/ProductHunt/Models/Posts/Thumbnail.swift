//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Thumbnail : Mappable{

	var id : Int?
	var imageUrl : String?
	var mediaType : String?
	var metadata : CurrentUser?

	func mapping(map: Map)
	{
		id <- map["id"]
		imageUrl <- map["image_url"]
		mediaType <- map["media_type"]
		metadata <- map["metadata"]
		
	}
    
    required init?(map: Map) {}
}
