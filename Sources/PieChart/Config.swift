import Foundation

public struct Config {
    
    var pieSizeRatio: Double
    var lineWidthMultiplier: Double
    var holeSizeRatio: Double
    
    public init(
        space: Double = 0,
        hole: Double = 0,
        pieSizeRatio: Double = 0.8
    ) {
        self.pieSizeRatio = min(max(pieSizeRatio, 0), 1)
        self.lineWidthMultiplier = min(max(space, 0), 1) / 10
        self.holeSizeRatio = min(max(hole, 0), 1)
    }
}
