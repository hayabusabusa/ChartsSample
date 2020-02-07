//
//  TEAContributionGraph.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//
//  https://github.com/xhacker/TEAChart/blob/master/TEAChart/TEAContributionGraph.m
//

import UIKit
import CoreGraphics

class TEAContributionGraph: UIView {
    
    // MARK: Properties
    
    private var cellSize: CGFloat = 0
    private var cellSpacing: CGFloat = 0
    
    private var gradeCount: Int = 5
    private var gradeMinCutoff: [Int] = [Int]()
    private var graphMonth: Date = Date()
    
    private var colors: [UIColor] = [UIColor]()
    
    private var showDayNumbers: Bool = true
    
    weak var delegate: TEAContributionGraphDataSource? {
        didSet {
            loadDefault()
        }
    }
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawGraph()
    }
    
    // MARK: Private
    
    private func loadDefault() {
        // Load one-time data from the delegate
        
        // Get the total number of grades
        if let gradeCount = delegate?.numberOfGrades() {
            self.gradeCount = gradeCount
        }
        
        // Load all of the colors from the delegate
        if delegate != nil {
            for i in 0 ..< gradeCount {
                colors.append(delegate!.colorForGrade(grade: i))
            }
        } else {
            colors = [
                UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1),
                UIColor(red: 0.839, green: 0.902, blue: 0.522, alpha: 1),
                UIColor(red: 0.549, green: 0.776, blue: 0.396, alpha: 1),
                UIColor(red: 0.267, green: 0.639, blue: 0.251, alpha: 1),
                UIColor(red: 0.118, green: 0.408, blue: 0.137, alpha: 1)
            ]
            
            // Check if there is the correct number of colors
            if gradeCount != 5 {
                fatalError("The number of grades does not match the number of colors. Implement colorForGrade: to define a different number of colors than the default 5")
            }
        }
        
        // Get the minimum cutoff for each grade
        if delegate != nil {
            for i in 0 ..< gradeCount {
                gradeMinCutoff.append(delegate!.minimumValueForGrade(grade: i))
            }
        } else {
            gradeMinCutoff = [
                0,
                1,
                3,
                6,
                8
            ]
            
            if gradeCount != 5 {
                fatalError("The number of grades does not match the number of grade cutoffs. Implement minimumValueForGrade: to define the correct number of cutoff values")
            }
        }
        
        if let graphMonth = delegate?.monthForGraph() {
            self.graphMonth = graphMonth
        }
        
        cellSpacing = floor(frame.width / 20)
        cellSize = cellSpacing * 2
    }
    
    private func drawGraph() {
//        let context = UIGraphicsGetCurrentContext()
//
//        var calendar = Calendar(identifier: .gregorian)
//        calendar.locale = .current
//        var comp = calendar.dateComponents([.year, .month, .day], from: graphMonth)
//        comp.day = 1
//
//        let firstDay = calendar.date(from: comp)
//        let firstWeekday = calendar.firstWeekday
//
//        comp.month! += 1
//        let nextMonth = calendar.date(from: comp)
//
//        let weekdayNames = DateFormatter().veryShortWeekdaySymbols!
//
//        UIColor(white: 0.56, alpha: 1).setFill()
//
//        let textHeight = cellSize * 1.2
//        for i in 0 ..< 7 {
//            let rect = CGRect(x: CGFloat(i) * (cellSize + cellSpacing), y: 0, width: cellSize, height: cellSize)
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineBreakMode = .byClipping
//            paragraphStyle.alignment = .center
//            let attributes: [NSAttributedString.Key: Any] = [
//                .font: UIFont(name: "HelveticaNeue-Light", size: cellSize * 0.65)!,
//                .paragraphStyle: paragraphStyle
//            ]
//            NSString(string: weekdayNames[(i + firstWeekday - 1) % 7]).draw(in: rect, withAttributes: attributes)
//        }
//
//        var dayNumberTextAttribute: [NSAttributedString.Key: Any]? = nil
//        if showDayNumbers {
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.alignment = .left
//            dayNumberTextAttribute = [
//                .font: UIFont(name: "HelveticaNeue-Light", size: cellSize * 0.4)!,
//                .paragraphStyle: paragraphStyle
//            ]
//        }
    }
}
