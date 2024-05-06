# RelativeDateFormat

## UnitsStyle

### condensed

SNS style unit style.

```swift
// "just now"
Date.now.formatted(.relative(unitsStyle: .condensed))

// 1d
Date.aDayAgo.formatted(.relative(unitsStyle: .condensed))

// 2024/01/01
Date.aMonthAgo.formatted(.relative(unitsStyle: .condensed))
```

# License

RelativeDateFormat is available under the MIT license. See the LICENSE file for more info.
