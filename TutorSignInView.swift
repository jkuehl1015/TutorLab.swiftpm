//
//  TutorSignInView.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
    import SwiftUI

    @available(iOS 17.0, *)
    struct TutorSignInView: View {
        @Environment(AppData.self) private var dataManager
        @State private var tutorNameInput: String = ""
        @State private var tutorBlockInput: Int? = nil
        @State private var shouldGoToList = false
        var body: some View {
            
            VStack {
                Text("Tutor Sign-In")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                
                TextField("Tutor's Name", text: $tutorNameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Tutor's Block", value: $tutorBlockInput, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
            
                .padding()
                
                NavigationLink {
                    TuteeListView(tutorBlock: tutorBlockInput ?? 1, tuturName: tutorNameInput)
                } label: {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        
        func signInTuor() {
            let newTutor = Tutor(
                name: tutorNameInput,
                block: tutorBlockInput
                )
            dataManager.addTutor(newTutor: newTutor)
            
            shouldGoToList = true
        }
        
    }
