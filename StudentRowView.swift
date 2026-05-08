//
//  StudentRowView.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/7/26.
//
import SwiftUI
struct StudentRowView: View {
    var student: Student
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(student.studentName)
                .font(.headline)
                .foregroundStyle(.blue)
            
            Divider()
            
            Group{
                InfoRow(label: "Block", value: "\(String(describing: student.studentBlock))")
                InfoRow(label: "ID", value: "\(String(describing: student.studentID))")
                InfoRow(label: "Teacher", value: student.studentTeacher)
                InfoRow(label: "Subject", value: student.studentSubject)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
        }
}

struct InfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label).fontWeight(.semibold)
            Spacer()
            Text("\(value)")
        }
        .font(.subheadline)
    }
    
}

