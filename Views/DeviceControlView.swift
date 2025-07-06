//
//  DeviceControlView.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import SwiftUI

struct DeviceControlView: View {
    @ObservedObject var device: Device
    
    var body: some View {
        VStack(spacing: 20) {
            Text(device.name)
                .font(Theme.titleFont)
                .foregroundColor(Theme.primaryColor)
            
            Toggle(isOn: $device.status) {
                Text("Power")
                    .font(Theme.bodyFont)
            }
            .toggleStyle(SwitchToggleStyle(tint: Theme.primaryColor))
            .onChange(of: device.status) { newValue in
                let message = newValue ? "ON" : "OFF"
                MQTTService.shared.publish(topic: "batcave/device/\(device.id)", message: message)
                Logger.log("\(device.name) turned \(message)")
                LocalStorageManager.shared.saveDevices([device]) // update state
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(device.name)
    }
}
