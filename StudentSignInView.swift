//
//  StudentSignInView.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
import SwiftUI

struct StudentSignInView: View {
    @Binding var stuInfo: Student
    var body: some View {
        Text("Student Sign In")
            .font(.system(size: 40))
            .fontWeight(.bold)
        TextField("Student ID", value: $stuInfo.studentID, format: .number)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.numberPad)
        TextField("Student Name", text: $stuInfo.studentName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Subject", text: $stuInfo.studentSubject)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student's Teacher", text: $stuInfo.studentTeacher)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Block", value: $stuInfo.studentBlock, format: .number)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.numberPad)
    }
}
