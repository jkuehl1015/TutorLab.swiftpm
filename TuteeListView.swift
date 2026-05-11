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
    @State private var showingAlert = false
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
                        
                    }
                    
                    
                }
                .listStyle(.plain)
                
            }
        }
                .navigationTitle("Block \(tutorBlock) Queue")
                .alert("Success!", isPresented: $showingAlert) {
                    Button("Ok") {}
                } message: {
                    Text("Student has been notified and removed from queue.")
            
            
        }
        
        
        
    }
    
    func acceptTutee(_ student: Student) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                dataManager.availableStudents.removeAll(where: { $0.id == student.id})
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sendEmail(to: student)
                showingAlert = true
                
            }
       
        }
    }
        
    
    func sendEmail(to student: Student) {
        let email = student.generatedEmail
        let subject = "TutorLab: You have a tutor".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let body = "Hi \(student.studentName), your request for \(student.studentSubject) was accepted. See you in the Library during block \(tutorBlock)!".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: "mailto:\(email)?subject=\(subject)&body=\(body)") {
            UIApplication.shared.open(url)
            
        }
        
    }
    
    
}

