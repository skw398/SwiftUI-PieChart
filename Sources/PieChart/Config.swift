//
//  Config.swift
//  
//
//  Created by Shigenari Oshio on 2022/11/10.
//

import Foundation

public struct Config {
    var pieSizeRatio: Double!
    var lineWidthMultiplier: Double!
    var holeSizeRatio: Double!
    
    public init(
        space: Double = 0,
        hole: Double = 0,
        pieSizeRatio: Double = 0.8
    ) {
        self.pieSizeRatio = convertTo0to1Value(pieSizeRatio)
        self.lineWidthMultiplier = convertTo0to1Value(space) / 10
        self.holeSizeRatio = convertTo0to1Value(hole)
        
        func convertTo0to1Value(_ value: Double) -> Double {
            switch value {
            case ..<0: return 0
            case 1...: return 1
            default: return value
            }
        }
    }
}
