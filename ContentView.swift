import SwiftUI

struct ContentView: View {
    @Binding var stuInfo: Save
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome To TutorLab")
                    .font(.largeTitle)
                    .fontWeight(.black)
                NavigationLink("Student Sign-In") { StudentSignInView(stuInfo: $stuInfo)
                }
                .frame(width: 175, height: 50, alignment: .center)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                NavigationLink("Teacher Sign-In") { TeacherSignInView()
                }
                .frame(width: 175, height: 50, alignment: .center)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                NavigationLink("Tutor Sign-In") { TutorSignInView()
                }
                .frame(width: 154, height: 50, alignment: .center)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            }
        }
    }
}
