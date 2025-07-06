//
//  EventLog.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import Foundation

struct EventLog: Identifiable, Codable {
    let id: UUID
    let timestamp: Date
    let eventDescription: String
    
    init(id: UUID = UUID(), timestamp: Date = Date(), description: String) {
        self.id = id
        self.timestamp = timestamp
        self.eventDescription = description
    }
}

