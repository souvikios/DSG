//
//  EventsSearchLocation.swift


import Foundation

struct EventsSearchLocation : Codable {

        let lat : Float?
        let lon : Float?

        enum CodingKeys: String, CodingKey {
                case lat = "lat"
                case lon = "lon"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                lat = try values.decodeIfPresent(Float.self, forKey: .lat)
                lon = try values.decodeIfPresent(Float.self, forKey: .lon)
        }

}
