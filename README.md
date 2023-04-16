# SwiftUI-PieChart

`Swift5.7+`  `iOS13+`

Easily draw pie charts with SwiftUI. 

<img alt="スクリーンショット 2023-04-16 22 52 36" src="https://user-images.githubusercontent.com/114917347/232315978-6b75fa72-0986-42af-b873-a4e1af9ed5cc.png" width="600">

### Examples


 ```swift
import PieChart
```

```swift
    var fruits: [(name: String, count: Int, color: Color)] = [
        ("apple", 10, .red),
        ("orange", 9, .orange),
        ("banana", 8, .yellow)
    ]    
```

#### 1.
```swift
    PieChart(
        values: fruits.map(\.count)
    )
```

#### 2.
```swift
    PieChart(
        values: fruits.map(\.count),
        colors: [.red, .orange, .yellow]
    )
```

or

```swift
    // Another instantiation
    // All the same parameters can be used.
    PieChart(fruits) { fruit in
        Item(
            value: fruit.count,
            color: fruit.color
        )
    }
```

#### 3.
```swift
    PieChart(
        fruits,
        backgroundColor: .black
    ) {
        Item(
            value: $0.count,
            color: $0.color
        )
    }
```

 #### 4.
 ```swift
    PieChart(
        values: fruits.map(\.count),
        config: Config(space: 0.5) // 0~1.0
    )
```

####  5.
 ```swift
    PieChart(
        values: fruits.map(\.count),
        config: Config(hole: 0.6) // 0~1.0
    )
```

 #### 6.
 ```swift
    PieChart(
        values: fruits.map(\.count),
        config: Config(space: 0.5, hole: 0.6)
    )
```

 #### 7.
 ```swift
    PieChart(
        values: [Int](repeating: 1, count: 7),
        backgroundColor: .gray,
        config: Config(
            pieSizeRatio: 1 // 0~1.0 Default 0.8
        )
    )
    .border(.black, width: 1)
    .frame(width: 75, height: 75)
```

#### 8.
```swift
    PieChart(
        values: [Int](repeating: 1, count: 7),
        backgroundColor: .gray,
        config: Config(
            pieSizeRatio: 0.5
        )
    )
    .border(.black, width: 1)
    .frame(width: 150, height: 150)
```

#### 9.
```swift
    // All parameters
    PieChart(
        values: [Int](repeating: 1, count: 7),
        colors: [.red, .orange, .yellow, .green, .cyan, .blue, .purple],
        backgroundColor: .black,
        config: Config(
            space: 0.3, hole: 0.5, pieSizeRatio: 0.7
        )
    )
    .cornerRadius(30)
    .frame(width: 150, height: 150)
```
