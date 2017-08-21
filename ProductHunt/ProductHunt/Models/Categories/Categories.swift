//
//	Categories.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import ObjectMapper

class Categories: Mappable {

	var categories: [Category]?

	func mapping(map: Map) {
		categories <- map["categories"]
	}

    required init?(map: Map) {}

}
