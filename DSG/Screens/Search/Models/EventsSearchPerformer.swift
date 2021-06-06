//
//  EventsSearchPerformer.swift


import Foundation

struct EventsSearchPerformer : Codable {

        let hasUpcomingEvents : Bool?
        let id : Int?
        let image : String?
        let imageAttribution : String?
        let imageLicense : String?
        let images : EventsSearchImage?
        let name : String?
        let numUpcomingEvents : Int?
        let popularity : Int?
        let primary : Bool?
        let score : Float?
        let shortName : String?
        let slug : String?
        let stats : EventsSearchStat?
        let taxonomies : [EventsSearchTaxonomy]?
        let type : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
               
                case hasUpcomingEvents = "has_upcoming_events"
                case id = "id"
                case image = "image"
                case imageAttribution = "image_attribution"
                case imageLicense = "image_license"
                case images = "images"
                case name = "name"
                case numUpcomingEvents = "num_upcoming_events"
                case popularity = "popularity"
                case primary = "primary"
                case score = "score"
                case shortName = "short_name"
                case slug = "slug"
                case stats = "stats"
                case taxonomies = "taxonomies"
                case type = "type"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
              
                hasUpcomingEvents = try values.decodeIfPresent(Bool.self, forKey: .hasUpcomingEvents)
                
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                image = try values.decodeIfPresent(String.self, forKey: .image)
                imageAttribution = try values.decodeIfPresent(String.self, forKey: .imageAttribution)
                imageLicense = try values.decodeIfPresent(String.self, forKey: .imageLicense)
                images = try values.decodeIfPresent(EventsSearchImage.self, forKey: .images)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                numUpcomingEvents = try values.decodeIfPresent(Int.self, forKey: .numUpcomingEvents)
                popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
                primary = try values.decodeIfPresent(Bool.self, forKey: .primary)
                score = try values.decodeIfPresent(Float.self, forKey: .score)
                shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
                slug = try values.decodeIfPresent(String.self, forKey: .slug)
                stats = try values.decodeIfPresent(EventsSearchStat.self, forKey: .stats)
                taxonomies = try values.decodeIfPresent([EventsSearchTaxonomy].self, forKey: .taxonomies)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
