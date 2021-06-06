//
//  EventsSearchStat.swift


import Foundation

struct EventsSearchStat : Codable {

        let eventCount : Int?

        enum CodingKeys: String, CodingKey {
                case eventCount = "event_count"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                eventCount = try values.decodeIfPresent(Int.self, forKey: .eventCount)
        }

}
