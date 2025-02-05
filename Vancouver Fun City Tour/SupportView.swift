import SwiftUI
import AVFoundation
import Photos

struct SupportScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var showCameraPicker = false
    @State private var showImageSourceSelection = false
    @State private var email = ""
    @State private var message = ""
    @State private var showConfirmationDialog = false
    @State private var set = false
    @State private var shouldDismiss = false

    var body: some View {
        ZStack {
            Image("launch")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text("Support")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: { set.toggle() }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 70)

                Button(action: { showImageSourceSelection = true }) {
                    ZStack {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(12)
                                .clipped()
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.4))
                                .frame(height: 200)
                                .overlay(
                                    VStack {
                                        Image(systemName: "paperclip")
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Text("Attach File / Image")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                )
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .actionSheet(isPresented: $showImageSourceSelection) {
                    ActionSheet(
                        title: Text("Select Image Source"),
                        buttons: [
                            .default(Text("Take a Photo")) { requestCameraPermission() },
                            .default(Text("Choose from Gallery")) { requestPhotoLibraryPermission() },
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    showImagePicker = false
                }) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                }
                .sheet(isPresented: $showCameraPicker, onDismiss: {
                    showCameraPicker = false
                }) {
                    ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                }
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Your Email")
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                    }
                    TextField("", text: $email)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black.opacity(0.4), lineWidth: 1)
                        )
                }
                .padding(.horizontal)

                ZStack(alignment: .topLeading) {
                    if message.isEmpty {
                        Text("Your Message")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 15)
                    }
                    TextEditor(text: $message)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black.opacity(0.4), lineWidth: 1)
                        )
                        .frame(height: 150)
                        .scrollContentBackground(.hidden)
                }
                .padding(.horizontal)

                Button(action: { showConfirmationDialog = true }) {
                    Text("Send Message")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("tit1"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .alert(isPresented: $showConfirmationDialog) {
                                  Alert(
                                      title: Text("Message Sent"),
                                      message: Text("Your message has been successfully sent."),
                                      dismissButton: .default(Text("OK"), action: {
                                          shouldDismiss = true
                                      })
                                  )
                              }

                Spacer()
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $set) {
            SettingsScreen()
        }
        .onChange(of: shouldDismiss) { newValue in
                  if newValue {
                      presentationMode.wrappedValue.dismiss()
                  }
              }
    }
    
    
    private func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    showCameraPicker = true
                } else {
                    showPermissionAlert()
                }
            }
        }
    }

   
    private func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized, .limited:
                    showImagePicker = true
                default:
                    showPermissionAlert()
                }
            }
        }
    }
    
   
    private func showPermissionAlert() {
        let alert = UIAlertController(
            title: "Permission Required",
            message: "Please enable camera and photo access in Settings.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Open Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(alert, animated: true, completion: nil)
        }
    }
}

#Preview {
    SupportScreen()
}
