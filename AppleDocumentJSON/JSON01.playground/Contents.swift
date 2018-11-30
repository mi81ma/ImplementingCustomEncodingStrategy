import Foundation

let data: Data // receive from anetwork request, for example
let json = try? JSONSerialization.jsonObject(with: data, options: [])

if let dictionary = jsonWithObjectRoot as? [String: Any] {
    if let number = dictionary["someKey"] as? Double {
        // access individual value in dictiorary
    }

    for (key, value) in dictionary {
        
    }
}
