/*
 The encode Function
 */
enum CodingKeys: String, CodingKey {
    case id = "employeeId"
    case name
    case gift
}


extension Employee3: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(favoriteToy.name, forKey: .gift)
    }
}
