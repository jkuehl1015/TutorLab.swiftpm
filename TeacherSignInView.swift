//
//  TeacherSignInView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 4/27/26.
//
import SwiftUI

struct TeacherSignInView: View {
    @Binding var teacherInfo: Teacher
    @State private var showingAlert = false
    var body: some View {
        VStack {
            Text("Teacher Referral")
                .font(.system(size: 40))
                .fontWeight(.bold)
            TextField("Student's ID", value: $teacherInfo.refferedStudentID, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            TextField("Student's Name", text: $teacherInfo.refferedStudent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student's Subject", text: $teacherInfo.refferedStudentSubject)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student's Teacher", text: $teacherInfo.refferelTeacher)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student's Block", value: $teacherInfo.refferedStudentBlock, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Refer") {
                showingAlert = true
            }
            .alert("Succecssfully Referred", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}
