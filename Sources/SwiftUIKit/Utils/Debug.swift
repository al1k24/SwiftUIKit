//
//  Debug.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import Foundation

public struct Debug {
    // Available colors
    // Source: - https://unicode.org/emoji/charts/full-emoji-list.html#geometric
    public enum Symbol: String {
        /// 🔴 Circle
        case red = "\u{1F534}"
        
        /// 🟠 Circle
        case orange = "\u{1F7E0}"
        
        /// 🟡 Circle
        case yellow = "\u{1F7E1}"
        
        /// 🟢 Circle
        case green = "\u{1F7E2}"
        
        /// 🔵 Circle
        case blue = "\u{1F535}"
        
        /// 🟣 Circle
        case purple = "\u{1F7E3}"
        
        /// 🟤 Circle
        case brown = "\u{1F7E4}"
        
        /// ⚫️ Circle
        case black = "\u{26AB}"
        
        /// ⚪️ Circle
        case white = "\u{26AA}"
    }
    
    public static func log(
        _ closure: @autoclosure () -> Any,
        _ symbol: Symbol = .white,
        functionName: StaticString = #function,
        fileName: StaticString = #file,
        lineNumber: Int = #line
    ) {
        let fileName: String = .init(describing: fileName)
        let closure: String = .init(describing: closure())
        let functionName: String = .init(describing: functionName)
        
        let formattedDate: String = Date().formatted(
            date: .numeric,
            time: .standard
        )
        
        let swiftFile: String = fileName.components(separatedBy: "/").last ?? ""
        let debugSymbol: String = symbol.rawValue
        
        print("\(debugSymbol) [Debug] \(formattedDate) [\(swiftFile):\(lineNumber)] \(functionName) > \(closure)")
    }
}


public func DEBUG(
    _ closure: @autoclosure () -> Any,
    _ symbol: Debug.Symbol = .white,
    functionName: StaticString = #function,
    fileName: StaticString = #file,
    lineNumber: Int = #line
) {
#if DEBUG
    Debug.log(
        closure(),
        symbol,
        functionName: functionName,
        fileName: fileName,
        lineNumber: lineNumber
    )
#endif
}
