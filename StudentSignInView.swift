//
//  StudentSignInView.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
import SwiftUI

@available(iOS 17.0, *)
struct StudentSignInView: View {
    @Environment(AppData.self) private var dataManager
    @State private var idInput: Int? = nil
    @State private var nameInput: String = ""
    @State private var subjectInput: String = ""
    @State private var teacherInput: String = ""
    @State private var blockInput: Int? = nil
    
    @State private var showingAlert = false
    var body: some View {
        VStack {
            Text("Student Sign-In")
                .font(.system(size: 40))
                .fontWeight(.bold)
            TextField("Student ID", value: $idInput, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            TextField("Student Name", text: $nameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student Subject", text: $subjectInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student's Teacher", text: $teacherInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Student Block", value: $blockInput, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Sign-Up") {
                let newArrival = Student(
                    id: idInput,
                    name: nameInput,
                    teacher: teacherInput,
                    subject: subjectInput,
                    block: blockInput
                )
                
                dataManager.addStudent(newStudent: newArrival)
                
                showingAlert = true
                clearFields()
            }
            .buttonStyle(.borderedProminent)
            .alert("Succecssfully Signed-Up", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        
        
    }
    func clearFields() {
        idInput = nil
        nameInput = ""
        subjectInput = ""
        teacherInput = ""
        blockInput = nil
        
        
        
        
    }
}
