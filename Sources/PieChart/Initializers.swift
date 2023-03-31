import SwiftUI

public extension PieChart {
    
    init(
        values: [some BinaryInteger],
        colors: [Color] = [],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init()
    ) {
        self.values = values.map { Double($0) }
        self.colors = colors.isEmpty ? defaultColors : colors
        self.pieSizeRatio = config.pieSizeRatio
        self.lineWidthMultiplier = config.lineWidthMultiplier
        self.holeSizeRatio = config.holeSizeRatio
        self.backgroundColor = backgroundColor
    }

    init(
        values: [some BinaryFloatingPoint],
        colors: [Color] = [],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init()
    ) {
        self.values = values.map { Double($0) }
        self.colors = colors.isEmpty ? defaultColors : colors
        self.pieSizeRatio = config.pieSizeRatio
        self.lineWidthMultiplier = config.lineWidthMultiplier
        self.holeSizeRatio = config.holeSizeRatio
        self.backgroundColor = backgroundColor
    }

    init<Data>(
        _ data: [Data],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init(),
        content: (Data) -> Item<some BinaryInteger>
    ) {
        values = []
        colors = []
        data.forEach {
            let item = content($0)
            values += [Double(item.value)]
            colors += [item.color]
        }
        self.pieSizeRatio = config.pieSizeRatio
        self.lineWidthMultiplier = config.lineWidthMultiplier
        self.holeSizeRatio = config.holeSizeRatio
        self.backgroundColor = backgroundColor
    }

    init<Data>(
        _ data: [Data],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init(),
        content: (Data) -> Item<some BinaryFloatingPoint>
    ) {
        values = []
        colors = []
        data.forEach {
            let item = content($0)
            values += [Double(item.value)]
            colors += [item.color]
        }
        self.pieSizeRatio = config.pieSizeRatio
        self.lineWidthMultiplier = config.lineWidthMultiplier
        self.holeSizeRatio = config.holeSizeRatio
        self.backgroundColor = backgroundColor
    }
}
