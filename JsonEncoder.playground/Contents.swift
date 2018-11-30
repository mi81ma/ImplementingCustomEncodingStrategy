import Foundation


let a = """
{ "employeeId": 7, "uname": "John Appleseed", "gift": "Teddy Bear" }
""".data(using: .utf8)

/*
 The encode Function
 */


enum CodingKeys: String, CodingKey {
    case id = "employeeId"
    case name
    case gift
}

extension Employee: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container = encoder.container(keyedBy: CodingKey.self)
        try container.encode(id, forKey: .id)
        try container.encode(favoriteToy, forKey: .gift)
    }
}
