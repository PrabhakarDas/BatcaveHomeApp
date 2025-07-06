//
//  SettingsView.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("serverHost") private var serverHost = "broker.hivemq.com"
    @AppStorage("serverPort") private var serverPort = 1883
    
    var body: some View {
        Form {
            Section(header: Text("MQTT Server")) {
                TextField("Host", text: $serverHost)
                Stepper("Port: \(serverPort)", value: $serverPort, in: 1...65535)
            }
            
            Section(header: Text("App Theme")) {
                ColorPicker("Accent Color", selection: .constant(Color.accentColor))
            }
            
            Section {
                Button("Clear Logs") {
                    UserDefaults.standard.removeObject(forKey: "eventLogs")
                }
            }
        }
        .navigationTitle("Settings")
    }
}
