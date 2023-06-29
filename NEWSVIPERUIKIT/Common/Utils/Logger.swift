//
//  Logger.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation

import Foundation

enum LogLevel: String {
    case verbose = "VERBOSE"
    case debug = "DEBUG"
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
}

class Logger {
    static let shared = Logger()
    
    var logLevel: LogLevel = .info
    
    private init() {}
    
    func log(_ message: String, level: LogLevel) {
        if level.rawValue >= logLevel.rawValue {
            print("[\(level.rawValue)] \(message)")
        }
    }
    
    func verbose(_ message: String) {
        log(message, level: .verbose)
    }
    
    func debug(_ message: String) {
        log(message, level: .debug)
    }
    
    func info(_ message: String) {
        log(message, level: .info)
    }
    
    func warning(_ message: String) {
        log(message, level: .warning)
    }
    
    func error(_ message: String) {
        log(message, level: .error)
    }
}
