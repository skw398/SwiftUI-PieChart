//
//  Item.swift
//  
//
//  Created by Shigenari Oshio on 2022/11/10.
//

import Foundation
import SwiftUI

public struct Item<Value> {
    let value: Value
    let color: Color
    
    public init(value: Value, color: Color) {
        self.value = value
        self.color = color
    }
}
