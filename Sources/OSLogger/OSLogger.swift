//
//  OSLogger.swift
//
//
//  Created by Pasini, Nicolò on 18/09/2019.
//

import os.log
import Foundation

public class Logger: LoggingService {

    private let logQueue: DispatchQueue
    private var categorizedLogObjects: [String: OSLog]

    init() {
        categorizedLogObjects = [:]
        logQueue = DispatchQueue(label: "logger.queue", qos: .utility)
    }

    private func getCurrentThread() -> String {
        if Thread.isMainThread {
            return "main"
        } else {
            if let threadName = Thread.current.name, !threadName.isEmpty {
                return"\(threadName)"
            } else if let queueName = String(validatingUTF8: __dispatch_queue_get_label(nil)), !queueName.isEmpty {
                return"\(queueName)"
            } else {
                return String(format: "%p", Thread.current)
            }
        }
    }

    private func createOSLog(category: String) -> OSLog {
        logQueue.sync {
            if let log = categorizedLogObjects[category] {
                return log
            } else {
                let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "Logger", category: category)
                categorizedLogObjects[category] = log
                return log
            }
        }
    }

    public func log(category: String, message: String, access: LogAccessLevel, type: LogType, fileName: String, functionName: String, lineNumber: Int) {

        var logMessage: StaticString
        let line = String(lineNumber)
        let osType = type.getOSLogType()
        let currentThread = getCurrentThread()
        let logCategory = createOSLog(category: category)
        let file = (fileName as NSString).lastPathComponent

        switch access {
        case .public:
            logMessage = "[thread: %{public}@] [%{public}@:%{public}@ %{public}@] > %{public}@"
        case .private:
            logMessage = "[thread: %{private}@] [%{private}@:%{private}@ %{private}@] > %{private}@"
        }

        os_log(logMessage, log: logCategory, type: osType, currentThread, file, line, functionName, message)
    }
}
