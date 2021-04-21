//
//  File.swift
//  
//
//  Created by Nicolò Pasini on 21/04/21.
//

import Foundation

public protocol LoggingService {
    func log(category: String, message: String, access: LogAccessLevel, type: LogType, fileName: String, functionName: String, lineNumber: Int)
}

public extension LoggingService {
    func infoLog(category: LogCategory, message: String, access: LogAccessLevel = LogAccessLevel.private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(category: category.rawValue, message: message, access: access, type: .info, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    func debugLog(category: LogCategory, message: String, access: LogAccessLevel = LogAccessLevel.private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(category: category.rawValue, message: message, access: access, type: .debug, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    func errorLog(category: LogCategory, message: String, access: LogAccessLevel = LogAccessLevel.private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(category: category.rawValue, message: message, access: access, type: .error, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    func faultLog(category: LogCategory, message: String, access: LogAccessLevel = LogAccessLevel.private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(category: category.rawValue, message: message, access: access, type: .fault, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    func defaultLog(category: LogCategory, message: String, access: LogAccessLevel = LogAccessLevel.private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(category: category.rawValue, message: message, access: access, type: .default, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
}
