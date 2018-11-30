import UIKit

struct Geo : Decodable {
    var latitude :Double
    var longitude :Double
}

struct Address : Decodable {
    var street :String
    var cinty :String
    var state :String
    var geo :Geo
}


struct Customer : Decodable {
    var firstName :String
    var lastName :String
    var address :Address
}


struct CustomersResponse :Decodable {
    var customers :[Customer]
}


let json = """

{
    "customers":[
        {
        "firstName" : "John",
        "lastname" : "Doe",
        "address" : {
                "street" : "1200 Richmond Ave",
                "city"   : "Houston",
                "state" : "TX",
                "geo" : {
                        "latitude" : 34.56,
                        "longitude" :35.65
                    }
            }
        }
    ]

}

""".data(using: .utf8)!

let customersResponse = try! JSONDecoder()
