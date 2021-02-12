//
//  TestResponse.swift
//  test_exe
//
//  Created by Jirawat on 12/2/2564 BE.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?

    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case countryCode = "alpha3Code"
    }
}
