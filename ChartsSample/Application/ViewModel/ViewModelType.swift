//
//  ViewModelType.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
