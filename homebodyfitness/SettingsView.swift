
import SwiftUI

struct SettingsView: View {
    
    @State private var isShowingPremium = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    Button(action: {
                        self.openPrivacy()
                    }) {
                        Text("Privacy Policy")
                    }
                    Button(action: {
                        self.openTerms()
                    }) {
                        Text("Terms of Use")
                    }
                    Button(action: {
                        self.isShowingPremium.toggle()
                    }) {
                        Text("Premium")
                    }
                    NavigationLink(destination: CopyrightsView()) {
                        Text("Copyrights")
                    }
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
        .sheet(isPresented: self.$isShowingPremium) {
            PurchasingView()
        }
    }
    
    private func openPrivacy() {
        if let url = URL(string: "") {
            UIApplication.shared.open(url)
        }
    }
    
    private func openTerms() {
        if let url = URL(string: "") {
            UIApplication.shared.open(url)
        }
    }
    
}
