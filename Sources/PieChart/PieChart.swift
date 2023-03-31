import SwiftUI

public struct PieChart: View {
    
    var values: [Double] = []
    
    var pieSizeRatio: Double = 0.8
    var holeSizeRatio: Double = 0
    var lineWidthMultiplier: Double = 0
    
    var colors: [Color] = []
    var backgroundColor: Color = .init(UIColor.systemBackground)
    // Color.teal is for iOS 15.0+
    let teal: Color = .init(red: 48 / 255, green: 176 / 255, blue: 199 / 255)
    var defaultColors: [Color] { [.blue, .green, .orange, .purple, .red, teal, .yellow] }

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
                ForEach (values.indices, id: \.self ) { i in
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
                        .overlay(path.stroke(backgroundColor, lineWidth: lineWidth))
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
