//
//	Category.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Category : Mappable{

	var color : String?
	var id : Int?
	var itemName : String?
	var name : String?
	var slug : String?


	func mapping(map: Map)
	{
		color <- map["color"]
		id <- map["id"]
		itemName <- map["item_name"]
		name <- map["name"]
		slug <- map["slug"]
		
	}
    
    required init?(map: Map) {}
}
