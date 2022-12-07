//
//  Item.swift
//
//
//  Created by Shigenari Oshio on 2022/11/10.
//

import SwiftUI

public struct PieChart: View {
    private var values: [Double] = []
    
    private var pieSizeRatio: Double = 0.8
    private var holeSizeRatio: Double = 0
    private var lineWidthMultiplier: Double = 0
    
    private var colors: [Color] = []
    private var backgroundColor: Color = .init(UIColor.systemBackground)
    // Color.teal is for iOS 15.0+
    private var teal: Color = .init(red: 48 / 255, green: 176 / 255, blue: 199 / 255)
    private var defaultColors: [Color] { [.blue, .green, .orange, .purple, .red, teal, .yellow] }

    public var body: some View {
        GeometryReader { geometry in
            let totalValue = values.reduce(0, +)
            let angles = values.reduce(into: [-90.0]) { (angles, value) in
                angles.append(angles.last! + value / totalValue * 360)
            }
            let shorterSideLength: CGFloat = min(geometry.size.width, geometry.size.height)
            let center: CGPoint = .init(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let lineWidth: CGFloat = shorterSideLength * pieSizeRatio * lineWidthMultiplier
            let radius: CGFloat = shorterSideLength * pieSizeRatio / 2 + lineWidth / 2
            let holeRadius: CGFloat = radius * holeSizeRatio - lineWidth / 4
            
            ZStack {
                // Slices
                ForEach ( 0 ..< values.count, id: \.self ) { i in
                    let path = Path { path in

                        path.move(to: center)
                        path.addArc(center: center,
                                    radius: radius,
                                    startAngle: Angle(degrees: angles[i]),
                                    endAngle: Angle(degrees: angles[i + 1]),
                                    clockwise: false)
                        path.closeSubpath()
                    }
                    path
                        .fill(colors[i % colors.count])
                        .overlay(path.stroke(backgroundColor,
                                             lineWidth: lineWidth))
                }
                
                // Hole
                Path { path in
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: holeRadius,
                                startAngle: Angle(degrees: 0),
                                endAngle: Angle(degrees: 360),
                                clockwise: false)
                    path.closeSubpath()
                }
                .fill(backgroundColor)
            }
            .background(backgroundColor)
            .clipped()
        }
        .frame(idealHeight: UIScreen.main.bounds.width)
    }
}

// Initializers
public extension PieChart {
//     // swift 5.7~
//    init(
//        values: [some BinaryInteger],
    init<Integer: BinaryInteger>(
        values: [Integer],
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

    init<FloatingPoint: BinaryFloatingPoint>(
        values: [FloatingPoint],
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

    init<
        Datum,
        Integer: BinaryInteger
    >(
        _ data: [Datum],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init(),
        content: (Datum) -> Item<Integer>
    ) {
        values = []; colors = []
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

    init<
        Datum,
        FloatingPoint: BinaryFloatingPoint
    >(
        _ data: [Datum],
        backgroundColor: Color = .init(UIColor.systemBackground),
        config: Config = .init(),
        content: (Datum) -> Item<FloatingPoint>
    ) {
        values = []; colors = []
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
