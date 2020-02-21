import Foundation

struct InfoStruct: Decodable {
    let items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }

    init(items: [Item]?) {
        self.items = items
    }
}


struct Item: Decodable {
    let link: String?
    let media: Media?
    
    enum CodingKeys: String, CodingKey {
        case link = "link"
        case media = "media"
      
    }

    init(link: String?, media: Media?) {
        self.link = link
        self.media = media
     
    }
}

class Media: Decodable {
    let m: String?
    
    enum CodingKeys: String, CodingKey {
        case m = "m"
    }

    init(m: String?) {
        self.m = m
    }
}

