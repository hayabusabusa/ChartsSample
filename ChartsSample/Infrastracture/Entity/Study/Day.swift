//
//  Day.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/06.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

struct Day {
    let date: Date
    let studies: [Study]
    
    var seconds: [Int] {
        return studies.map { $0.seconds }
    }
    
    var sum: Int {
        return studies.reduce(0) { $0 + $1.seconds }
    }
}
