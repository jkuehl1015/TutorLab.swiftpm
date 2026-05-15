//
//  TeacherSignInView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 4/27/26.
//
import SwiftUI

@available(iOS 17.0, *)
struct TeacherSignInView: View {
    @Environment(AppData.self) private var dataManager
    @State private var studentID: Int? = nil
    @State private var studentFirstName: String = ""
    @State private var studentLastName: String = ""
    @State private var subject: String = ""
    @State private var teacherName: String = ""
    @State private var block: Int? = nil
    
    @State private var showingAlert = false
    var body: some View {
        ScrollView{
            VStack {
                Text("Teacher Referral")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                TextField("Student's ID", value: $studentID, format: .number.grouping(.never))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                HStack {
                    TextField("Student's First Name", text: $studentFirstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Student's Last Name", text: $studentLastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                TextField("Student's Subject", text: $subject)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Student's Teacher", text: $teacherName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Student's Block", value: $block, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                

                Button(action: {
                    let referredStudent = Student(
                        id: studentID,
                        firstName: studentFirstName,
                        lastName: studentLastName,
                        teacher: teacherName,
                        subject: subject,
                        block: block ?? 1
                    )
                    
                    dataManager.addStudent(newStudent: referredStudent)
                    
                    showingAlert = true
                    clearFields()
                }) {
                    Text("Refer")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .alert("Successfully Referred Student", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
            }
        }
    }
    func clearFields() {
        studentID = nil
        studentFirstName = ""
        studentLastName = ""
        subject = ""
        teacherName = ""
        block = nil
    }
    
}
