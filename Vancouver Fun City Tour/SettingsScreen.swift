import SwiftUI
import WebKit
import StoreKit
struct SettingsScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showTermsWebView = false
    @State private var showPrivacyWebView = false
    @State private var notifications = false

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

                    Text("Settings")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 40)

                
                VStack(spacing: 16) {
                    SettingOptionButton(icon: "kk1", title: "Notifications", action: {
                        notifications.toggle()
                    })

                    SettingOptionButton(icon: "kk3", title: "Rate App", action: {
                        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                            AppStore.requestReview(in: scene)
                        }
                    })

                    SettingOptionButton(icon: "kk4", title: "Terms of Service", action: {
                        showTermsWebView = true
                    })

                    SettingOptionButton(icon: "kk5", title: "Privacy Policy", action: {
                        showPrivacyWebView = true
                    })
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        
        .sheet(isPresented: $showTermsWebView) {
            WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavo-trms/")!)
        }
        .sheet(isPresented: $showPrivacyWebView) {
            WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavor-priv/")!)
        }
        .fullScreenCover(isPresented: $notifications, content: {
            NotificationsScreen()
        })
        .navigationBarHidden(true)
    }
}

struct SettingOptionButton: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(icon)
                    .foregroundColor(.white)
                    .padding()
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.black.opacity(0.4))
            .cornerRadius(12)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    SettingsScreen()
}
