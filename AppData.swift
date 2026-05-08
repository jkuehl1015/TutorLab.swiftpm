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
    
    func addStudent(newStudent: Student) {availableStudents.append(newStudent)}
    func addTeacher(newTeacher: Teacher) {teacherReferrals.append(newTeacher)}
    func addTutor(newTutor: Tutor) {availableTutors.append(newTutor)}
}
