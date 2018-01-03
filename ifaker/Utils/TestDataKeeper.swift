//
//  TestDataKeeper.swift
//  ifaker
//
//  Created by andrew zakordonets on 03/01/2018.
//  Copyright © 2018 biercoff. All rights reserved.
//

import Foundation

class TestDataKeeper {
    static let wordsArray: [String] = PlistReader.getValue(of: "words", from: "words", as: [String].self).flatMap {
        $0
    } ?? ["undefined"]
}
