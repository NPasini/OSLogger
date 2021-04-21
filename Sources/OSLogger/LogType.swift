//
//  LogType.swift
//
//
//  Created by Pasini, Nicolò on 18/09/2019.
//

import os.log
import Foundation

public enum LogType {
    case info
    case fault
    case error
    case debug
    case `default`

    func getOSLogType() -> OSLogType {
        switch self {
        case .info:
            return OSLogType.info
        case .fault:
            return OSLogType.fault
        case .error:
            return OSLogType.error
        case .debug:
            return OSLogType.debug
        case .default:
            return OSLogType.default
        }
    }
}
