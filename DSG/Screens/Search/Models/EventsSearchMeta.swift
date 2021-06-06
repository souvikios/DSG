//
//  EventsSearchMeta.swift


import Foundation

struct EventsSearchMeta : Codable {

        let page : Int?
        let perPage : Int?
        let took : Int?
        let total : Int?

        enum CodingKeys: String, CodingKey {
                case page = "page"
                case perPage = "per_page"
                case took = "took"
                case total = "total"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                page = try? values.decodeIfPresent(Int.self, forKey: .page)
                perPage = try? values.decodeIfPresent(Int.self, forKey: .perPage)
                took = try? values.decodeIfPresent(Int.self, forKey: .took)
                total = try? values.decodeIfPresent(Int.self, forKey: .total)
        }

}
