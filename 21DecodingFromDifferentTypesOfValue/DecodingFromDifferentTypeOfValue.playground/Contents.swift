import UIKit

struct Place :Decodable {

    var latitude :Double
    var longitude :Double

    private enum CodingKeys :String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder :Decoder) throws {

        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.latitude = try container.decode(Double.self, forKey: .latitude)
            self.longitude = try container.decode(Double.self, forKey: .longitude)
        } else if var container = try? decoder.unkeyedContainer() {

            self.latitude = try container.decode(Double.self)
            self.longitude = try container.decode(Double.self)
        }
        else if let container = try? decoder.singleValueContainer() {

            let string = try container.decode(String.self)
            let value = string.components(separatedBy: ",")

            guard values.count == 2,
                let latitude = Double(value[0]),
                let longitude = Double(value[1]) else {

                    throw DecodableError.dataCorruptedError(in: countainer, debugDescription: "Unable to decode coordinates")
            }

            self.latitude = latitude
            self.longitude = longitude
        }
        else {
            let context = DecodingError.Context.init(codingPath: decoder.codingPath, debugDescription: "Unable to decode coodinates!")
            throw DecodingError.dataCorrupted(context)
        }
    }
}


let payload1 = """

{
    "coordinates" : [
        {
        "latitude": 37.332,
        "longitude": -122.011
        }
    ]
}

""".data(using: .utf8)!


let payload2 = """

{
    "coordinates" : [
    [37.332, -122.011]
    ]
}

""".data(using: .utf8)!


let payload3 = """

{
    "coordinates" : [
    "37.332, -122.011"
   ]
}

""".data(using: .utf8)!

let placesDictionary = try! JSONDecoder().decode([String:[Place]].self, from: payload3)
if let places = placesDictionary["coordinates"] {
    places[0].latitude
    places[0].longitude
}
