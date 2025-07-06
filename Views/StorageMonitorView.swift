//
//  StorageMonitorView.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import SwiftUI
import Charts

struct StorageMonitorView: View {
    @State private var status = StorageStatus(isUsingCloud: false,
                                              localUsageMB: 1200,
                                              cloudUsageMB: 800)
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Use Cloud Storage", isOn: $status.isUsingCloud)
                .padding()
                .onChange(of: status.isUsingCloud) { usingCloud in
                    Logger.log("Storage mode changed: \(usingCloud ? "Cloud" : "Local")")
                }
            
            Chart {
                BarMark(
                    x: .value("Type", "Local"),
                    y: .value("MB", status.localUsageMB)
                )
                BarMark(
                    x: .value("Type", "Cloud"),
                    y: .value("MB", status.cloudUsageMB)
                )
            }
            .frame(height: 200)
            .padding()
            
            Spacer()
        }
        .navigationTitle("Storage Monitor")
        .padding()
    }
}
