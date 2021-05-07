/*
Copyright 2021 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/
    

import SwiftUI
import WebKit

struct HtmlOfferView: View {
    @State var htmlString = ""
    
    var body: some View {
        WebView(htmlString: self.$htmlString)
            .multilineTextAlignment(.center)
            .frame(height: 150)
            .frame(maxWidth: .infinity)
    }
}

struct WebView: UIViewRepresentable {
    @Binding var htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(self.htmlString, baseURL: nil)
    }
}

struct HtmlOfferView_Previews: PreviewProvider {
    static var previews: some View {
        HtmlOfferView(htmlString: "<!DOCTYPE html><html><body><h1>Sample Html</h1></body></html>")
    }
}