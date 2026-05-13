//
//  AdminLiveQueueView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/12/26.
//

import SwiftUI
@available(iOS 17.0, *)
struct AdminLiveQueueView: View {
    @Environment(AppData.self) private var dataManager
    @State private var selectedBlock: Int = 1
    
    var filteredStudents: [Student] {
        dataManager.availableStudents.filter { $0.studentBlock == selectedBlock}
    }
    var body: some View {
        List {
            Section {
                Picker("Select Block", selection: $selectedBlock) {
                    ForEach(1...8, id: \.self) { block in
                        Text("\(block)").tag(block)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Choose Block")
            }
            
            Section {
                ForEach(filteredStudents) { student in
                    StudentRowView(student: student)
                }
            }
        }
        .navigationTitle("Live Queue")
        .overlay {
            if filteredStudents.isEmpty {
                ContentUnavailableView("No Students", systemImage: "person.3", description: Text("No one is waiting in Block \(selectedBlock)"))
                    .padding(.top, 100)
            }
        }
    }
}
