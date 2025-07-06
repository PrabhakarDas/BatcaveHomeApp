//
//  Device.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import Foundation
import Combine

class Device: ObservableObject, Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id, name, type, status
    }
    
    let id: UUID
    let name: String
    let type: String
    @Published var status: Bool
    
    init(id: UUID = UUID(), name: String, type: String, status: Bool = false) {
        self.id = id
        self.name = name
        self.type = type
        self.status = status
    }
    
    // MARK: Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id     = try container.decode(UUID.self, forKey: .id)
        name   = try container.decode(String.self, forKey: .name)
        type   = try container.decode(String.self, forKey: .type)
        status = try container.decode(Bool.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id,     forKey: .id)
        try container.encode(name,   forKey: .name)
        try container.encode(type,   forKey: .type)
        try container.encode(status, forKey: .status)
    }
}

