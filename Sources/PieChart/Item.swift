import SwiftUI

public extension PieChart {
    
    struct Item<Value> {
        
        let value: Value
        let color: Color
        
        public init(value: Value, color: Color) {
            self.value = value
            self.color = color
        }
    }
}
