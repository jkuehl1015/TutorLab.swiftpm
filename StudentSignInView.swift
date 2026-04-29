//
//  StudentSignInView.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
import SwiftUI

struct StudentSignInView: View {
    @Binding var stuInfo: Save
    var body: some View {
        Text("Student Sign In")
        TextField("Student ID", value: $stuInfo.studentID, format: .number)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Name", text: $stuInfo.studentName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Subject", text: $stuInfo.studentSubject)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Teacher", text: $stuInfo.studentTeacher)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Student Block", value: $stuInfo.studentBlock, format: .number)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
