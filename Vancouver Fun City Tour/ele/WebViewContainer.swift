import Foundation
import SwiftUI
@preconcurrency import WebKit
import UIKit

struct WebViewContainer: UIViewRepresentable {
    let url: URL
        var onPageStarted: ((URL?) -> Void)?
        var onPageFinished: ((URL?) -> Void)?
        var onProgressChanged: ((Double) -> Void)?
        @Binding var webView: WKWebView?

         func makeUIView(context: Context) -> WKWebView {
         let webView = WKWebView()
         webView.navigationDelegate = context.coordinator
         webView.uiDelegate = context.coordinator
         webView.addObserver(context.coordinator, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)

         // Загружаем URL
         webView.load(URLRequest(url: url))

         // Присваиваем webView
         DispatchQueue.main.async {
             self.webView = webView
         }

         // Добавляем кастомный жест "Назад"
         let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePanGesture(_:)))
         webView.addGestureRecognizer(panGesture)

         return webView
     }

        func updateUIView(_ uiView: WKWebView, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(onPageStarted: onPageStarted, onPageFinished: onPageFinished, onProgressChanged: onProgressChanged, webView: $webView)
        }

        class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            var onPageStarted: ((URL?) -> Void)?
            var onPageFinished: ((URL?) -> Void)?
            var onProgressChanged: ((Double) -> Void)?

            var completionHandler: (([URL]?) -> Void)?
            @Binding var webView: WKWebView?


            
            init(onPageStarted: ((URL?) -> Void)?, onPageFinished: ((URL?) -> Void)?, onProgressChanged: ((Double) -> Void)?, webView: Binding<WKWebView?>) {
                     self.onPageStarted = onPageStarted
                     self.onPageFinished = onPageFinished
                     self.onProgressChanged = onProgressChanged
                     self._webView = webView
                 }
            
            @available(iOS 15, *)
                func webView(
                    _ webView: WKWebView,
                    requestMediaCapturePermissionFor origin: WKSecurityOrigin,
                    initiatedByFrame frame: WKFrameInfo,
                    type: WKMediaCaptureType,
                    decisionHandler: @escaping (WKPermissionDecision) -> Void
                ) {
                    decisionHandler(.grant)
                }
            // Обработка жеста "Назад"
           
                 @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
                     guard let webView = webView else {
                         print("webView is nil")
                         return
                     }

                     if gesture.state == .ended {
                         let translation = gesture.translation(in: webView)
                         print("Gesture detected with translation: \(translation.x)")

                         if translation.x > 100 && webView.canGoBack {
                             print("Going back")
                             webView.goBack()
                         }
                     }
                 }

            func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
                onPageStarted?(webView.url)
            }

            func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                onPageFinished?(webView.url)
            }

            override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
                if keyPath == #keyPath(WKWebView.estimatedProgress), let webView = object as? WKWebView {
                    onProgressChanged?(webView.estimatedProgress)
                }
            }

           


            deinit {
                webView?.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
            }
        }
   
     
    }
