import SwiftUI

struct NotificationsScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
        
            Image("launch")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
              
                HStack {
                   
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }

                    Spacer()

                  
                    Text("Notifications")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                
                }
                .padding(.horizontal)
                .padding(.top, 40)

                Spacer()

             
                Text("All notification and updates in\nthe app will be displayed here")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NotificationsScreen()
}
