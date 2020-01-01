//
//  MockStudyProvider.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MockStudyProvider: AnyObject {
    var studiesRelay: BehaviorRelay<[Study]> { get }
    
    func acceptRandomMock(number: Int)
}

final class MockStudyProviderImpl: MockStudyProvider {
    
    // MARK: Singleton
    
    static let shared: MockStudyProviderImpl = .init()
    
    // MARK: Properties
    
    let studiesRelay: BehaviorRelay<[Study]>
    
    // MARK: Initializer
    
    private init() {
        studiesRelay = .init(value: [])
        acceptRandomMock(number: 10)
    }
    
    // MARK: Public
    
    func acceptRandomMock(number: Int) {
        let mock = stride(from: 0, to: number, by: 1)
            .map { Study(title: "Mock data number \($0)", date: Date(), seconds: Int.random(in: 0 ..< 36000), colorCode: ColorPalette.randomColorCode()) }
        studiesRelay.accept(mock)
    }
}
