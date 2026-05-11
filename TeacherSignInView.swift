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
    @State private var studentName: String = ""
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
                TextField("Student's Full Name", text: $studentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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
                
                Button("Refer") {
                    
                    let referredStudent = Student(
                            id: studentID,
                            name: studentName,
                            teacher: teacherName,
                            subject: subject,
                            block: block
                        )
                    dataManager.addStudent(newStudent: referredStudent)
                    
                    
                    showingAlert = true
                    clearFields()
                }
                .buttonStyle(.borderedProminent)
                .alert("Succecssfully Referred", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
    func clearFields() {
        studentID = nil
        studentName = ""
        subject = ""
        teacherName = ""
        block = nil
    }
    
}
