//
//  TEAContributionGraphDataSource.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//
//  https://github.com/xhacker/TEAChart/blob/master/TEAChart/TEAContributionGraph.h
//

import UIKit

protocol TEAContributionGraphDataSource: AnyObject {
    // - Required
    
    /// For the current date, return [NSDate date]
    ///
    /// - Returns: A NSDate in month that the graph should display
    func monthForGraph() -> Date
    
    /// If there is no value, return nil
    ///
    /// - Parameters:
    ///     - day: Defined from 1 to the last day of the month in the graph.
    ///     
    /// - Returns: The value to display for each day of the month.
    func valueForDay(day: Int) -> Int
    
    // - Optional
    
    /// If this method isn't implemented, the default value of 5 is used.
    ///
    /// - Returns: Returns the number of color divides in the graph.
    func numberOfGrades() -> Int
    
    /// Each grade requires exactly one color.
    /// If this method isn't implemented, the default 5 color scheme is used.
    ///
    /// - Parameters:
    ///     - grade: The grade index. From 0-numberOfGrades
    ///
    /// - Returns: A UIColor for the specified grade.
    func colorForGrade(grade: Int) -> UIColor
    
    /// defines how values are translated into grades.
    /// If this method isn't implemented, the default values are used.
    ///
    /// - Parameters:
    ///     - grade: The grade from 0-numberOfGrades.
    ///
    /// - Returns: An NSUInteger that specifies the minimum cutoff for a grade
    func minimumValueForGrade(grade: Int) -> Int
}
