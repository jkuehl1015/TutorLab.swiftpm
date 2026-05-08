//
//  Save.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
import SwiftUI

class Student: Identifiable {
    var studentID: Int? = nil
    var studentName: String
    var studentTeacher: String
    var studentSubject: String
    var studentBlock: Int? = nil
    
    var generatedEmail: String {
        let firstInitial = studentName.prefix(1).lowercased()
        let lastName = studentName.components(separatedBy: " ").last?.lowercased() ?? ""
        let idString = String(studentID ?? 0)
        let lastFour = String(idString.suffix(4))
        
        return "\(firstInitial)\(lastName)\(lastFour)@stu.d214.org"
    }
    
    
    
    init(id: Int? = nil, name: String = "", teacher: String = "", subject: String = "", block: Int? = nil) {
        self.studentID = id
        self.studentName = name
        self.studentTeacher = teacher
        self.studentSubject = subject
        self.studentBlock = block
    
    }
}

class Teacher {
    var refferedStudent: String
    var refferedStudentSubject: String
    var refferedStudentBlock: Int? = nil
    var refferedStudentID: Int? = nil
    var refferelTeacher: String
    
    init(student: String = "", subject: String = "", block: Int? = nil, id: Int? = nil, teacher: String = "") {
        self.refferedStudent = student
        self.refferedStudentSubject = subject
        self.refferedStudentBlock = block
        self.refferedStudentID = id
        self.refferelTeacher = teacher
    }
    
}
    class Tutor {
        var tutorName: String
        var tutorBlock: Int? = nil
        
        init(name: String = "", block: Int? = nil) {
            self.tutorName = name
            self.tutorBlock = block
        }
    }
    
    
    

