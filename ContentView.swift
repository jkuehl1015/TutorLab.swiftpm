import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome To TutorLab")
                    .font(.largeTitle)
                    .fontWeight(.black)
                NavigationLink("Student Sign-In") { StudentSignInView()
                }
                NavigationLink("Teacher Sign-In") { TeacherSignInView()
                }
            }
        }
    }
}
