//
//	Post.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import ObjectMapper

class Post: Mappable {

	var name: String?
	var redirectUrl: String?
	var screenshotUrl: ScreenshotUrl?
	var tagline: String?
	var thumbnail: Thumbnail?
	var user: User?
	var votesCount: Int?

	func mapping(map: Map) {
		name <- map["name"]
		redirectUrl <- map["redirect_url"]
		screenshotUrl <- map["screenshot_url"]
		tagline <- map["tagline"]
		thumbnail <- map["thumbnail"]
		user <- map["user"]
		votesCount <- map["votes_count"]
	}

    required init?(map: Map) {}

}
