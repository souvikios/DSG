//
//  EventsSearchDocumentSource.swift

import Foundation

struct EventsSearchDocumentSource : Codable {

        let generationType : String?
        let sourceType : String?

        enum CodingKeys: String, CodingKey {
                case generationType = "generation_type"
                case sourceType = "source_type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                generationType = try values.decodeIfPresent(String.self, forKey: .generationType)
                sourceType = try values.decodeIfPresent(String.self, forKey: .sourceType)
        }

}
