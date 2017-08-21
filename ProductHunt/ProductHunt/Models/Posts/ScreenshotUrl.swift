//
//	ScreenshotUrl.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import ObjectMapper

class ScreenshotUrl: Mappable {

	var small: String?
	var big: String?

	func mapping(map: Map) {
		small <- map["300px"]
		big <- map["850px"]
	}

    required init?(map: Map) {}

}
