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
    let tuturName: String
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
        
        let match = AcceptedPairing(
            studentName: "\(student.studentFirstName) \(student.studentLastName)",
            tutorName: "Tutor = \(tuturName)",
            subject: student.studentSubject,
            date: Date()
        )
        
        dataManager.acceptedPairings.insert(match, at: 0)
        
        withAnimation {
            dataManager.availableStudents.removeAll(where: { $0.id == student.id})
        }
        sendEmail(to: student)
        showingAlert = true
    }
        
    
    func sendEmail(to student: Student) {
        let email = student.generatedEmail
        let fullName = "\(student.studentFirstName) \(student.studentLastName)"
        let rawSubject = "TutorLab: You have a tutor"
        let rawBody = "Hi \(fullName), your request for \(student.studentSubject) was accepted. See you in the Library during block \(tutorBlock)!"
        let encodedSubject = rawSubject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = rawBody.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)"
        
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
        
        
        
    }
    
    
}

