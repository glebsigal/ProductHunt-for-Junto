//
//	Post.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Post : Mappable{

	var categoryId : Int?
	var commentsCount : Int?
	var createdAt : String?
	var currentUser : CurrentUser?
	var day : String?
	var discussionUrl : String?
	var exclusive : AnyObject?
	var featured : Bool?
	var id : Int?
	var iosFeaturedAt : AnyObject?
	var makerInside : Bool?
	var makers : [AnyObject]?
	var name : String?
	var platforms : [AnyObject]?
	var productState : String?
	var redirectUrl : String?
	var screenshotUrl : ScreenshotUrl?
	var tagline : String?
	var thumbnail : Thumbnail?
	var topics : [AnyObject]?
	var user : User?
	var votesCount : Int?


	func mapping(map: Map)
	{
		categoryId <- map["category_id"]
		commentsCount <- map["comments_count"]
		createdAt <- map["created_at"]
		currentUser <- map["current_user"]
		day <- map["day"]
		discussionUrl <- map["discussion_url"]
		exclusive <- map["exclusive"]
		featured <- map["featured"]
		id <- map["id"]
		iosFeaturedAt <- map["ios_featured_at"]
		makerInside <- map["maker_inside"]
		makers <- map["makers"]
		name <- map["name"]
		platforms <- map["platforms"]
		productState <- map["product_state"]
		redirectUrl <- map["redirect_url"]
		screenshotUrl <- map["screenshot_url"]
		tagline <- map["tagline"]
		thumbnail <- map["thumbnail"]
		topics <- map["topics"]
		user <- map["user"]
		votesCount <- map["votes_count"]
		
	}
    
    required init?(map: Map) {}

}
