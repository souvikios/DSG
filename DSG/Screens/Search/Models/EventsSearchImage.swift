//
//  EventsSearchImage.swift


import Foundation

struct EventsSearchImage : Codable {

        let huge : String?

        enum CodingKeys: String, CodingKey {
                case huge = "huge"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                huge = try values.decodeIfPresent(String.self, forKey: .huge)
        }

}
