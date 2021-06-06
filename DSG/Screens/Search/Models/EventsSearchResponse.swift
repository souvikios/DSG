//
//  EventsSearchResponse.swift


import Foundation

struct EventsSearchResponse : Codable {

        let events : [EventsSearchEvent]?
        let meta : EventsSearchMeta?

        enum CodingKeys: String, CodingKey {
                case events = "events"
                case meta = "meta"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                events = try values.decodeIfPresent([EventsSearchEvent].self, forKey: .events)
                meta = try values.decodeIfPresent(EventsSearchMeta.self, forKey: .meta)
        }

}
