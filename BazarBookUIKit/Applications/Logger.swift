//
//  Logger.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 21/07/25.
//

import Foundation
import os.log

public enum LogLevel: String {
    case debug = "DEBUG"
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
}

public struct Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "MyApp"
    private static let log = OSLog(subsystem: subsystem, category: "Default")
    
    public static func log(_ message: String, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let logMessage = "[\(level.rawValue)] [\(fileName):\(line)] \(function) - \(message)"
        
        switch level {
        case .debug:
            os_log(.debug, log: log, "%{public}@", logMessage)
        case .info:
            os_log(.info, log: log, "%{public}@", logMessage)
        case .warning:
            os_log(.error, log: log, "%{public}@", logMessage)
        case .error:
            os_log(.fault, log: log, "%{public}@", logMessage)
        }
        
        #if DEBUG
        print(logMessage)
        #endif
    }
    
    public static func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .debug, file: file, function: function, line: line)
    }
    
    public static func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .info, file: file, function: function, line: line)
    }
    
    public static func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .warning, file: file, function: function, line: line)
    }
    
    public static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(message, level: .error, file: file, function: function, line: line)
    }
}
