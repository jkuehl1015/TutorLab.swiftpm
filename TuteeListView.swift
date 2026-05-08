//
//  TuteeListView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/7/26.
//

import SwiftUI

@available(iOS 17.0, *)
struct TuteeListView: View {
    @Environment(AppData.self) private var dataManager
    
    var body: some View {
        NavigationStack {
            if dataManager.availableStudents.isEmpty {
                ContentUnavailableView("No Students", systemImage: "person.3.fill", description: Text("Waiting for students to sign up..."))
            } else {
                List(dataManager.availableStudents) { student in
                    StudentRowView(student: student)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .navigationTitle("Tutee Queue")
            }
        }
        
    }
}
