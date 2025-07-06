//
//  LocalStorageManager.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import Foundation

class LocalStorageManager {
    static let shared = LocalStorageManager()
    private let logsKey     = "eventLogs"
    private let devicesKey  = "deviceStates"
    
    private init() { }
    
    func saveLog(_ log: EventLog) {
        var logs = loadLogs()
        logs.append(log)
        if let data = try? JSONEncoder().encode(logs) {
            UserDefaults.standard.set(data, forKey: logsKey)
        }
    }
    
    func loadLogs() -> [EventLog] {
        guard
            let data = UserDefaults.standard.data(forKey: logsKey),
            let logs = try? JSONDecoder().decode([EventLog].self, from: data)
        else {
            return []
        }
        return logs
    }
    
    func saveDevices(_ devices: [Device]) {
        if let data = try? JSONEncoder().encode(devices) {
            UserDefaults.standard.set(data, forKey: devicesKey)
        }
    }
    
    func loadDevices() -> [Device] {
        guard
            let data = UserDefaults.standard.data(forKey: devicesKey),
            let decoded = try? JSONDecoder().decode([Device].self, from: data)
        else {
            return []
        }
        return decoded
    }
}
