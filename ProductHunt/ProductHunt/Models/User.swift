//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class User : Mappable{

	var createdAt : String?
	var headline : String?
	var id : Int?
	var imageUrl : ImageUrl?
	var name : String?
	var profileUrl : String?
	var twitterUsername : String?
	var username : String?
	var websiteUrl : String?


	func mapping(map: Map)
	{
		createdAt <- map["created_at"]
		headline <- map["headline"]
		id <- map["id"]
		imageUrl <- map["image_url"]
		name <- map["name"]
		profileUrl <- map["profile_url"]
		twitterUsername <- map["twitter_username"]
		username <- map["username"]
		websiteUrl <- map["website_url"]
		
	}
    
    required init?(map: Map) {}
}
