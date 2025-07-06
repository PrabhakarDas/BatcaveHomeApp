//
//  Logger.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import Foundation

class Logger {
    static func log(_ message: String) {
        let entry = EventLog(description: message)
        LocalStorageManager.shared.saveLog(entry)
        print("[\(entry.timestamp)]: \(message)")
    }
}
