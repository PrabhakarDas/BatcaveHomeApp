//
//  BatcavecoreApp.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import SwiftUI

@main
struct BatcaveHomeAppApp: App {
    @StateObject private var mqttService = MQTTService.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                DashboardView()
            }
            .onAppear {
                mqttService.connect()
            }
        }
    }
}
