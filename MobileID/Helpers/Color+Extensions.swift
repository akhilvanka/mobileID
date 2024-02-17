//
//  Color+Extensions.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

extension Color {
    static func randomThree() -> [Color] {
//        return colors.randomElement()
        var colors = [Color]()
        for _ in 0..<3 {
            // Generate random RGB values
            let red = Double.random(in: 0..<1)
            let green = Double.random(in: 0..<1)
            let blue = Double.random(in: 0..<1)
            
            // Create a Color with the random RGB values
            let color = Color(red: red, green: green, blue: blue)
            
            // Append the color to the array
            colors.append(color)
        }
        return colors
    }
}
