//
//  Save.swift
//  TutorLab
//
//  Created by Jack L. Kuehl on 4/27/26.
//
import SwiftUI

class Student {
    var studentID: Int? = nil
    var studentName: String
    var studentTeacher: String
    var studentSubject: String
    var studentBlock: Int? = nil
    
    init() {
        self.studentID = nil
        self.studentName = ""
        self.studentTeacher = ""
        self.studentSubject = ""
        self.studentBlock = nil
    }
}
