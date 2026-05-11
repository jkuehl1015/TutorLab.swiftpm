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
    let tutorBlock: Int
    
    var filteredStudents: [Student] {
        dataManager.availableStudents.filter{ $0.studentBlock == tutorBlock
        }
    }
        var body: some View {
            NavigationStack {
                if filteredStudents.isEmpty {
                    ContentUnavailableView("No Students", systemImage: "person.3.fill", description: Text("Waiting for students to sign up..."))
                } else {
                    List(filteredStudents) { student in
                        VStack {
                            StudentRowView(student: student)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            
                            Button(action: {
                                acceptTutee(student)
                            }) {
                                Label("Accept Student", systemImage: "checkmark.circle.fill")
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                        
                        
                    }
                    .listStyle(.plain)
                    
                }
                
            }
            .navigationTitle("Block \(tutorBlock) Queue")
            
            
        }
        
        func acceptTutee(_ student: Student) {
            sendEmail(to: student)
            dataManager.availableStudents.removeAll(where: { $0.id == student.id })
        }
        
        func sendEmail(to student: Student) {
            let email = student.generatedEmail
            let subject = "TutorLab: You have a tutor".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let body = "Hi \(student.studentName), your request for \(student.studentSubject) was accepted. See you in the Library during block \(tutorBlock)!".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            if let url = URL(string: "malito:\(email)?subject=\(subject)&body=\(body)") {
                UIApplication.shared.open(url)
                
            }
            
        }
        
        
    }

