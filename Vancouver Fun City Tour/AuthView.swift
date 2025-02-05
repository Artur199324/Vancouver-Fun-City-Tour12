import SwiftUI

struct AuthView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var usernameValid = false
    @State private var passwordValid = false
    @State private var errorMessage = ""
    @State private var ava = false
    @State private var men = false
    @ObservedObject var isLogin = AuthManager.shared
    
    private let defaultUsername = "testuser"
    private let defaultPassword = "password123"
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                
                Text(isLogin.isLogin ? "LOG IN TO ACCOUNT" : "CREATE ACCOUNT")
                    .font(Font.custom("Georgia", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("tit1"))
                    .padding(.bottom, 8)
                    .padding(.top, 26)
                
                Text(isLogin.isLogin ? "Log in to your already created account" : "Create your account to receive notifications and feedback")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 16)
                
                VStack(spacing: 16) {
                    
                    ZStack(alignment: .leading) {
                        if username.isEmpty {
                            Text("Username")
                                .foregroundColor(.gray)
                                .padding(.leading, 15)
                        }
                        TextField("", text: $username, onEditingChanged: { _ in
                            usernameValid = !username.isEmpty
                        })
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("tit2"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(usernameValid ? Color.green : Color("tit2"), lineWidth: 2)
                        )
                    }
                    .frame(height: 50)
                    
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(.gray)
                                .padding(.leading, 15)
                        }
                        SecureField("", text: $password, onCommit: {
                            passwordValid = password.count >= 6
                        })
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("tit2"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(passwordValid ? Color.green : Color("tit2"), lineWidth: 2)
                        )
                    }
                    .frame(height: 50)
                }
                .padding(.horizontal, 32)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 8)
                }
                
                Button(action: {
                    if isLogin.isLogin {
                        handleLogin()
                    } else {
                        handleSignUp()
                    }
                }) {
                    Text(isLogin.isLogin ? "Log In" : "Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("tit1"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 32)
                .padding(.top, 16)
                
                HStack {
                    Text(isLogin.isLogin ? "Don't have an account yet?" : "Already have an account?")
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        withAnimation {
                            isLogin.isLogin.toggle()
                            errorMessage = ""
                        }
                    }) {
                        Text(isLogin.isLogin ? "Sign up" : "Sign in")
                            .foregroundColor(Color("tit1"))
                            .bold()
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 28)
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.black.opacity(0.5))
                    .padding(.horizontal, 20)
            )
            
            Spacer()
            
            Button(action: {
                LoginManager.shared.saveLoginStatus(isLoggedIn: true)
                men.toggle()
            }) {
                Text("Continue as Guest")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.3))
                    .cornerRadius(20)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
        }
        .background(Image("launch").resizable().scaledToFill())
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $ava) {
            AvatarSelectionView()
        }
        .fullScreenCover(isPresented: $men) {
            MainMenuView()
        }
    }
    
    private func handleSignUp() {
        guard !username.isEmpty else {
            errorMessage = "Username cannot be empty."
            return
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            return
        }
        
        UserDefaults.standard.set(username, forKey: "SavedUsername")
        UserDefaults.standard.set(password, forKey: "SavedPassword")
        errorMessage = ""
        username = ""
        password = ""
        LoginManager.shared.saveLoginStatus(isLoggedIn: true)
        ava.toggle()
    }
    
    private func handleLogin() {
        let savedUsername = UserDefaults.standard.string(forKey: "SavedUsername") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "SavedPassword") ?? ""
        
        if username == savedUsername && password == savedPassword {
            errorMessage = "Login successful!"
            men.toggle()
            LoginManager.shared.saveLoginStatus(isLoggedIn: true)
        } else if username == defaultUsername && password == defaultPassword {
            errorMessage = "Default account login successful!"
            men.toggle()
            LoginManager.shared.saveLoginStatus(isLoggedIn: true)
        } else {
            errorMessage = "Invalid username or password."
        }
    }
}

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    @Published var isLogin = false
}

#Preview {
    AuthView()
}
