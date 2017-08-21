//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import ObjectMapper

class Thumbnail: Mappable {

	var imageUrl: String?

	func mapping(map: Map) {
		imageUrl <- map["image_url"]
	}

    required init?(map: Map) {}
}
