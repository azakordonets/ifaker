/*
 * PlistReader.swift
 *
 * Copyright (c) 2012-2017 Vimpelcom Ltd.
 * All rights reserved.
 *
 * This software is the proprietary copyright of Vimpelcom Ltd.
 * and has been licensed for internal evaluation purposes only. If you are
 * the licensee, you are not permitted to further distribute this software
 * or to use it for any purpose other than internal evaluation. If you are
 * not the licensee then you are not authorised to use this software in
 * any manner and should immediately return it to Vimpelcom Ltd.
 *
 */

import Foundation

class PlistReader {    

    static func getValue<T: Any>(of key: String,
                                 from resourceName: String,
                                 withExtension extention: String = "plist",
                                 as type: T.Type) -> T? {
        guard let URL = Bundle(for: self).url(forResource: resourceName, withExtension: extention) else {
            print("I was not able to find \(resourceName).\(extention) resource file")
            return nil
        }
        guard let fileContent = NSDictionary(contentsOf: URL) as? [String: Any] else {
            print("I was not able to read \(key) content and convert it into [String: Any]")
            return nil
        }
        return fileContent[key] as? T
    }

}
