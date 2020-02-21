//
//  info.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import Foundation

class InfoStruct: Decodable {
    let title: String?
    let link: String?
    let infoStructDescription: String?
    let modified: Date?
    let generator: String?
    let items: [MM]

//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case link = "link"
//        case infoStructDescription = "description"
//        case modified = "modified"
//        case generator = "generator"
//    }
//
//    init(title: String?, link: String?, infoStructDescription: String?, modified: Date?, generator: String?, items: String?) {
//        self.title = title
//        self.link = link
//        self.infoStructDescription = infoStructDescription
//        self.modified = modified
//        self.generator = generator
//    }
}

class MM: Decodable {
    let title: String
    let link: String
}
