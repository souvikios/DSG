//
//  EventsSearchVenue.swift


import Foundation

struct EventsSearchVenue : Codable {

        let address : String?
        let capacity : Int?
        let city : String?
        let country : String?
        let displayLocation : String?
        let extendedAddress : String?
        let hasUpcomingEvents : Bool?
        let id : Int?
        let location : EventsSearchLocation?
        let metroCode : Int?
        let name : String?
        let nameV2 : String?
        let numUpcomingEvents : Int?
        let popularity : Int?
        let postalCode : String?
        let score : Float?
        let slug : String?
        let state : String?
        let timezone : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case address = "address"
                case capacity = "capacity"
                case city = "city"
                case country = "country"
                case displayLocation = "display_location"
                case extendedAddress = "extended_address"
                case hasUpcomingEvents = "has_upcoming_events"
                case id = "id"
                case location = "location"
                case metroCode = "metro_code"
                case name = "name"
                case nameV2 = "name_v2"
                case numUpcomingEvents = "num_upcoming_events"
                case popularity = "popularity"
                case postalCode = "postal_code"
                case score = "score"
                case slug = "slug"
                case state = "state"
                case timezone = "timezone"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                address = try values.decodeIfPresent(String.self, forKey: .address)
                capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
                city = try values.decodeIfPresent(String.self, forKey: .city)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                displayLocation = try values.decodeIfPresent(String.self, forKey: .displayLocation)
                extendedAddress = try values.decodeIfPresent(String.self, forKey: .extendedAddress)
                hasUpcomingEvents = try values.decodeIfPresent(Bool.self, forKey: .hasUpcomingEvents)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                location = try values.decodeIfPresent(EventsSearchLocation.self, forKey: .location)

                metroCode = try values.decodeIfPresent(Int.self, forKey: .metroCode)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                nameV2 = try values.decodeIfPresent(String.self, forKey: .nameV2)
                numUpcomingEvents = try values.decodeIfPresent(Int.self, forKey: .numUpcomingEvents)
                popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
                postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
                score = try values.decodeIfPresent(Float.self, forKey: .score)
                slug = try values.decodeIfPresent(String.self, forKey: .slug)
                state = try values.decodeIfPresent(String.self, forKey: .state)
                timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
