//
//  ColorScheme.swift
//  RememberMe
//
//  Created by zombietux on 01/04/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

struct CodableColor: Codable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}

extension CodableColor {
    init(color: UIColor) {
        let ciColor = CIColor(color: color)
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        alpha = ciColor.alpha
    }
    
    var color: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

struct ColorScheme: Equatable {
    let name: String
    let phoneNumberColor: UIColor
    let introduceColor: UIColor
    let nameColor: UIColor
    
    static let defaultScheme = ColorScheme(name: "default", phoneNumberColor: .cloudBurst, introduceColor: .wedgewood, nameColor: .grayChateau)
    static let webScheme = ColorScheme(name: "web", phoneNumberColor: .cyan, introduceColor: .red , nameColor: .cyan)
}

extension ColorScheme: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumberColor
        case introduceColor
        case nameColor
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        phoneNumberColor = (try container.decode(CodableColor.self, forKey: .phoneNumberColor)).color
        introduceColor = (try container.decode(CodableColor.self, forKey: .introduceColor)).color
        nameColor = (try container.decode(CodableColor.self, forKey: .nameColor)).color
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(CodableColor(color: phoneNumberColor), forKey: .phoneNumberColor)
        try container.encode(CodableColor(color: introduceColor), forKey: .introduceColor)
        try container.encode(CodableColor(color: introduceColor), forKey: .nameColor)
    }
}
