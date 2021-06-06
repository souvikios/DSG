
//  EventsSearchEvent.swift
//  Created by Souvik Das on 05/06/21.

import Foundation

struct EventsSearchEvent : Codable {

        let announceDate : String?
        let conditional : Bool?
        let createdAt : String?
        let dateTbd : Bool?
        let datetimeLocal : String?
        let datetimeTbd : Bool?
        let datetimeUtc : String?
        let descriptionField : String?
        let generalAdmission : Bool?
        let id : Int?
        let isOpen : Bool?
        let performers : [EventsSearchPerformer]?
        let popularity : Float?
        let score : Float?
        let shortTitle : String?
        let stats : EventsSearchStat?
        let status : String?
        let taxonomies : [EventsSearchTaxonomy]?
        let timeTbd : Bool?
        let title : String?
        let type : String?
        let url : String?
        let venue : EventsSearchVenue?
        let visibleUntilUtc : String?

        enum CodingKeys: String, CodingKey {
                case announceDate = "announce_date"
                case conditional = "conditional"
                case createdAt = "created_at"
                case dateTbd = "date_tbd"
                case datetimeLocal = "datetime_local"
                case datetimeTbd = "datetime_tbd"
                case datetimeUtc = "datetime_utc"
                case descriptionField = "description"
                case generalAdmission = "general_admission"
                case id = "id"
                case isOpen = "is_open"
                case performers = "performers"
                case popularity = "popularity"
                case score = "score"
                case shortTitle = "short_title"
                case stats = "stats"
                case status = "status"
                case taxonomies = "taxonomies"
                case timeTbd = "time_tbd"
                case title = "title"
                case type = "type"
                case url = "url"
                case venue = "venue"
                case visibleUntilUtc = "visible_until_utc"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
              
                announceDate = try? values.decodeIfPresent(String.self, forKey: .announceDate)
                conditional = try? values.decodeIfPresent(Bool.self, forKey: .conditional)
                createdAt = try? values.decodeIfPresent(String.self, forKey: .createdAt)
                dateTbd = try? values.decodeIfPresent(Bool.self, forKey: .dateTbd)
                datetimeLocal = try? values.decodeIfPresent(String.self, forKey: .datetimeLocal)
                datetimeTbd = try? values.decodeIfPresent(Bool.self, forKey: .datetimeTbd)
                datetimeUtc = try? values.decodeIfPresent(String.self, forKey: .datetimeUtc)
                descriptionField = try? values.decodeIfPresent(String.self, forKey: .descriptionField)
             
                generalAdmission = try? values.decodeIfPresent(Bool.self, forKey: .generalAdmission)
                id = try? values.decodeIfPresent(Int.self, forKey: .id)
                isOpen = try? values.decodeIfPresent(Bool.self, forKey: .isOpen)
                performers = try? values.decodeIfPresent([EventsSearchPerformer].self, forKey: .performers)
                popularity = try? values.decodeIfPresent(Float.self, forKey: .popularity)
                score = try? values.decodeIfPresent(Float.self, forKey: .score)
                shortTitle = try? values.decodeIfPresent(String.self, forKey: .shortTitle)
                stats = try? values.decodeIfPresent(EventsSearchStat.self, forKey: .stats)
                status = try? values.decodeIfPresent(String.self, forKey: .status)
                taxonomies = try? values.decodeIfPresent([EventsSearchTaxonomy].self, forKey: .taxonomies)
                timeTbd = try? values.decodeIfPresent(Bool.self, forKey: .timeTbd)
                title = try? values.decodeIfPresent(String.self, forKey: .title)
                type = try? values.decodeIfPresent(String.self, forKey: .type)
                url = try? values.decodeIfPresent(String.self, forKey: .url)
                venue = try? values.decodeIfPresent(EventsSearchVenue.self, forKey: .venue)
                visibleUntilUtc = try? values.decodeIfPresent(String.self, forKey: .visibleUntilUtc)
        }

}
