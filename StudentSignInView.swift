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
    @State private var firstNameInput: String = ""
    @State private var lastNameInput: String = ""
    @State private var subjectInput: String = ""
    @State private var teacherInput: String = ""
    @State private var blockInput: Int? = nil
    
    @State private var showingAlert = false
    var body: some View {
        VStack {
            Text("Student Sign-In")
                .font(.system(size: 40))
                .fontWeight(.bold)
            TextField("Student ID", value: $idInput, format: .number.grouping(.never))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            HStack {
                TextField("Student First Name", text: $firstNameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Student Last Name", text: $lastNameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
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
            
            Button(action: {
                // 1. Create the object
                let newArrival = Student(
                    id: idInput,
                    firstName: firstNameInput,
                    lastName: lastNameInput,
                    teacher: teacherInput,
                    subject: subjectInput,
                    block: blockInput ?? 1 // Providing a default to avoid 'Optional' hazards
                )
                
                // 2. Add to your data
                dataManager.addStudent(newStudent: newArrival)
                
                // 3. Trigger UI feedback
                showingAlert = true
                clearFields()
            }) {
                // 4. This is the "Label" part that controls how it looks
                Text("Sign-Up")
                    .font(.headline)
                    .frame(maxWidth: .infinity) // Makes it stretch across the screen
                    .padding()
                    .background(Color.blue) // You can use .black or any school color
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal) // Adds a little breathing room on the sides
            .alert("Successfully Signed-Up", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            
        }
            
        
    }
    func clearFields() {
        idInput = nil
        firstNameInput = ""
        lastNameInput = ""
        subjectInput = ""
        teacherInput = ""
        blockInput = nil
        
        
        
        
    }
}
