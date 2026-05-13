//
//  DataManager.swift
//  TutorLab
//
//  Created by Benjamin G. Harrison on 5/7/26.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable
class AppData {
    var availableStudents: [Student] = []
    var teacherReferrals: [Teacher] = []
    var availableTutors: [Tutor] = []
    var acceptedPairings: [AcceptedPairing] = []
    
    func addStudent(newStudent: Student) {availableStudents.append(newStudent)}
    func addTeacher(newTeacher: Teacher) {teacherReferrals.append(newTeacher)}
    func addTutor(newTutor: Tutor) {availableTutors.append(newTutor)}
    
    func logMath(student: Student, tutorName: String) {
        let newPair = AcceptedPairing(
            studentName: "\(student.studentFirstName) \(student.studentLastName)",
            tutorName: tutorName,
            subject: student.studentSubject,
            date: Date()
        )
            acceptedPairings.insert(newPair, at: 0)
    }
    
}

struct AcceptedPairing: Identifiable {
    var id = UUID()
    var studentName: String
    var tutorName: String
    var subject: String
    var date: Date
}
