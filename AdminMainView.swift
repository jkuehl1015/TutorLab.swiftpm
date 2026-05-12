//
//  AdminMainView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/12/26.
//

import SwiftUI
@available(iOS 17.0, *)
struct AdminMainView: View {
    @Environment(AppData.self) private var dataManager
    
    var body: some View {
        TabView{
            AdminDashboardView()
                .tabItem{
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
            
            AdminLiveQueueView()
                .tabItem {
                    Label("Live Queue", systemImage: "person.3.sequence.fill")
                }
        }
    }
}
