//
//  DashboardView.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import SwiftUI

struct DashboardView: View {
    // load saved devices or sample
    @State private var devices: [Device] = LocalStorageManager.shared.loadDevices()
    
    var body: some View {
        List {
            Section(header: Text("Devices")) {
                ForEach(devices) { device in
                    NavigationLink(device.name) {
                        DeviceControlView(device: device)
                    }
                }
            }
            
            Section {
                NavigationLink("Storage Monitor", destination: StorageMonitorView())
                NavigationLink("Settings", destination: SettingsView())
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("🦇 Batcave Control")
        .toolbar {
            Button("Reload") {
                devices = LocalStorageManager.shared.loadDevices()
            }
        }
    }
}
