import Foundation

//let jsonObj = ["Name":"Taro", "id":"123", "gender":"male", "age":"33"]

//do {
//    let jsonData = try JSONSerialization.data(withJSONObject: jsonObj, options: [])
//    let jsonStr = String(bytes: jsonData, encoding: .utf8)!
//    print(jsonStr)  // 生成されたJSON文字列 => {"Name":"Taro"}
//} catch let error {
//    print(error)
//}




//let jsonDict:[String:Any] =
//    [
//        "m": 0,
//        "i": 0,
//        "n":"function name",
//        "o":["OMSId":1,"InstrumentId": 2,"Interval":60,"IncludeLastCount":100]
//]

func jsonToString(x:Dictionary<String, Any>) -> String
{
    do{
        let jsonData = try JSONSerialization.data(withJSONObject: x, options: [])
        let jsonStr = String(bytes: jsonData, encoding: .utf8)!
//        print(jsonStr)

        return jsonStr

    } catch let error {
        return (error as! String)
    }
}



let insideDict:[String:Any] =
    [
        "OMSId":1,
        "InstrumentId": 2,
        "Interval":60,
        "IncludeLastCount":100
]

let insideDictToString = jsonToString(x: insideDict)
//let insideString = insideDictToString.replacingOccurrences(of: "\"", with: "\\\"")
//
//print("insideDictToString = \(insideDictToString)")

let a = "\(insideDictToString)"
//print("insideString = \(insideString)")


let jsonDict:[String:Any] =
    [
        "m": 0,
        "i": 0,
        "n":"function name",
        "o":a
]



var stringJson = jsonToString(x: jsonDict)

print(stringJson)

let st01 = stringJson.replacingOccurrences(of: "\"", with: "\\\"")
print(st01)
//
//let st02 = st01.replacingOccurrences(of: "\\\\", with: "\\\\\\")
////let a = put(st02)


print("{\"i\":20,\"n\":\"SubscribeTicker\",\"o\":\"{\\\"OMSId\\\":1,\\\"InstrumentId\\\": 1,\\\"Interval\\\":60,\\\"IncludeLastCount\\\":100}\"},\"m\":0")



//let regEx = stringJson.pregMatche(pattern: "0")
//print(regEx)
//
//print(stringJson.replacingOccurrences(of: "\"", with: "\\\""))

//let sample = Array(stringJson)
//var sampleArr = [Character]()
//
//var b = String(sample)
//
//print(b)
//
//var a:String!
//
//for i in sample {
//    print(i)
//
//    if i == "{" || i == "}" || i == "\""   {
//        sampleArr.append("\\")
//    }
//
//
//    sampleArr.append(i)
//}
//
////print(a)
////
//print(sampleArr)
//
//var c = String(sampleArr)
//


//print("\\")
//
//let d:String = "\\"

//print(d)

//var moji = "赤い花"
//if let range = moji.range(of: "赤い") {
//    moji.replaceSubrange(range, with: "青い")
//    print(moji)     // 青い花
//}


//let str:String = "book note pen bag"
//
//let a = str.startIndex
////print(str[str.endIndex])
//
//let characters = str.characters
//
