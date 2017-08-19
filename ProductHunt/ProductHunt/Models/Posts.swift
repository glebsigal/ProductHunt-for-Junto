//
//	Posts.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Posts : Mappable{

	var posts : [Post]?


	func mapping(map: Map)
	{
		posts <- map["posts"]
		
	}
    
    required init?(map: Map) {}
}
