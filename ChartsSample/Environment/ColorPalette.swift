//
//  ColorPalette.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

enum ColorPalette {
    private static let codes: [String] = [
        //"636E72", // American River
        "FDCB6E", // Bright Yarrow
        "D63031", // Chi-gong
        //"DFE6E9", // City Lights
        //"2D3436", // Dracula Orchid
        "0984E3", // Electron Blue
        "6C5CE7", // Exodus Fruit
        "81ECEC", // Faded Poster
        "FAB1A0", // First Date
        "74B9FF", // Green Darner Tail
        "55EFC4", // Light Greenish Blue
        "00B894", // Mint Leaf
        "E17055", // Orange Ville
        "FD79A8", // Pico 8 Pink
        "FF7675", // Pink Glamour
        "E84393", // Prunus Avium
        "00CEC9", // Rovins Egg Blue
        "A29BFE", // Shy moment
        //"B2BEC3", // Soothing Breeze
        "FFEAA7" // Sour Lemon
    ]
    
    static let americanRiver: UIColor = UIColor(named: "American river")!
    static let brightYarrow: UIColor = UIColor(named: "Bright yarrow")!
    static let chigong: UIColor = UIColor(named: "Chi-gong")!
    static let cityLights: UIColor = UIColor(named: "City lights")!
    static let draculaOrchid: UIColor = UIColor(named: "Dracula orchid")!
    static let electronBlue: UIColor = UIColor(named: "Electron blue")!
    static let exodusFruit: UIColor = UIColor(named: "Exodus fruit")!
    static let fadedPoster: UIColor = UIColor(named: "Faded poster")!
    static let firstDate: UIColor = UIColor(named: "First date")!
    static let greenDarnerTail: UIColor = UIColor(named: "Green darner tail")!
    static let lightGreenishBlue: UIColor = UIColor(named: "Light greenish blue")!
    static let mintLeaf: UIColor = UIColor(named: "Mint leaf")!
    static let orangeville: UIColor = UIColor(named: "Orangeville")!
    static let pico8Pink: UIColor = UIColor(named: "Pico-8 pink")!
    static let pinkGlamour: UIColor = UIColor(named: "Pink glamour")!
    static let prunusAvium: UIColor = UIColor(named: "Prunus avium")!
    static let robinsEggBlue: UIColor = UIColor(named: "Robin`s egg blue")!
    static let shyMoment: UIColor = UIColor(named: "Shy moment")!
    static let soothingBreeze: UIColor = UIColor(named: "Soothing breeze")!
    static let sourLemon: UIColor = UIColor(named: "Sour lemon")!
    
    static func randomColorCode() -> String {
        return codes[Int.random(in: 0 ..< codes.count)]
    }
}
