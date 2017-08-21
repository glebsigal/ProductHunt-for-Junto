//
//	Category.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import ObjectMapper

class Category: Mappable {

	var name: String?
	var slug: String?

	func mapping(map: Map) {
		name <- map["name"]
		slug <- map["slug"]
	}

    required init?(map: Map) {}
}
