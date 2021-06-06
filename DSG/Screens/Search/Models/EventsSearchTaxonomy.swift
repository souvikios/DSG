//
//  EventsSearchTaxonomy.swift


import Foundation

struct EventsSearchTaxonomy : Codable {

        let documentSource : EventsSearchDocumentSource?
        let id : Int?
        let name : String?
        let parentId : Int?
        let rank : Int?

        enum CodingKeys: String, CodingKey {
                case documentSource = "document_source"
                case id = "id"
                case name = "name"
                case parentId = "parent_id"
                case rank = "rank"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                documentSource = try values.decodeIfPresent(EventsSearchDocumentSource.self, forKey: .documentSource)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                parentId = try values.decodeIfPresent(Int.self, forKey: .parentId)
                rank = try values.decodeIfPresent(Int.self, forKey: .rank)
        }

}
