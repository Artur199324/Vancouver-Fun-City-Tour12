import SwiftUI

struct ProfileView: View {
    @State private var username: String = UserDefaults.standard.string(forKey: "SavedUsername") ?? "Guest"
    @State private var selectedAvatar: Int? = UserDefaults.standard.object(forKey: "SelectedAvatar") as? Int
    let avatars = ["avatar1", "avatar2"]
    @State private var set = false
    @State private var out = false
    
    var body: some View {
        NavigationView {
            ZStack {
              
                Image("launch")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

            
                VStack(spacing: 20) {
                  
                    HStack {
                        Text("Your Profile")
                            .font(.headline)
                            .foregroundColor(.white)

                        Spacer()

                        Button(action: {
                            set.toggle()
                        }) {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)

                  
                    if let avatarIndex = selectedAvatar, avatarIndex < avatars.count {
                        Image(avatars[avatarIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "person.crop.square.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                            .cornerRadius(20)
                    }

                    Text(username)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                   
                    VStack(spacing: 16) {
                        NavigationLink(destination: SupportScreen()) {
                            HStack {
                                Image("vc1")
                                    .foregroundColor(.white)
                                    .padding()
                                Text("Support")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }

                        HStack(spacing: 16) {
                            Button(action: {
                                AuthManager.shared.isLogin.toggle()
                                LoginManager.shared.toggleLoginStatus()
                                out.toggle()
                            }) {
                                HStack {
                                    Image("vc2")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Log Out")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(12)
                            }

                            Button(action: {
                                LoginManager.shared.toggleLoginStatus()
                                UserDataManager.shared.clearAllData()
                                out.toggle()
                            }) {
                                HStack {
                                    Image("vc3")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Delete")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
        } .fullScreenCover(isPresented: $set) {
            SettingsScreen()
        }
        .fullScreenCover(isPresented: $out) {
            AuthView()
        }
    }
    

}


#Preview {
    ProfileView()
}
