//
//  AdminView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/12/26.
//

import SwiftUI
@available(iOS 17.0, *)

struct AdminDashboardView: View {
    @Environment(AppData.self) private var dataManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Pending Requests (\(dataManager.availableStudents.count))") {
                    ForEach(dataManager.availableStudents) { student in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(student.studentFirstName) \(student.studentLastName)")
                                    .font(.headline)
                                Text(student.studentSubject)
                                    .font(.subheadline).foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text("Block \(student.studentBlock ?? 0)")
                                .font(.caption).padding(5)
                                .background(.blue.opacity(0.1)).cornerRadius(5)
                        }
                    }
                }
                
                Section("Active Matches") {
                    if dataManager.acceptedPairings.isEmpty {
                        Text("No Students Currently Matched")
                            .font(.caption).foregroundStyle(.secondary)
                    } else {
                        ForEach(dataManager.acceptedPairings) { pair in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(pair.studentName).bold()
                                    Image(systemName: "arrow.right").font(.caption)
                                    Text(pair.tutorName)
                                }
                                Text("Subject: \(pair.subject)")
                                    .font(.caption).foregroundStyle(.secondary)
                                Text(pair.date, style: .time)
                                    .font(.system(size: 10)).foregroundStyle(.tertiary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Admin Oversight")
        }
    }
}
