import SwiftUI
import Commons
import UIComponents
import Import

public struct OnboardingView: View {
    @ObservedObject
    var viewModel = OnboardingViewModel()
    
    @Environment(\.presentationMode)
    var presentationMode
    
    @State private var isPresentingEditView = true
    
    public init() { }
    
    public var body: some View {
        
        VStack {
            Text("Add to Light Wallet")
                .fontWeight(.heavy)
                .font(.system(size: 45))
                .padding(4.0)
            
            Form {
                Section {
                    HStack(spacing: 16) {
                        ColoredIconView(imageName: "plus.circle", foregroundColor: Color(.white), backgroundColor: Color(Colors.System.green))
                            .frame(width: 30, height: 30)
                        Text("Create New Wallet")
                            .font(.custom(font: .inter, size: 17, weight: .regular))
                    }.onTapGesture {
                        self.viewModel.createMainWallet()
                    }
                    
                    NavigationLink(destination: ScrollView {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Choose how you would like to import your wallet")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(Color(Colors.Label.secondary))
                                    .padding(.leading, 16)
                                Spacer()
                            }.padding(.top, 23)
                            VStack(spacing: 16) {
                                NavigationLink(destination: ImportHDWalletView(primary: true)) {
                                    ImportViewCategoryItem(icon: "ellipsis.rectangle.fill", color: Color(Colors.System.purple), title: "With Recovery Phrase", description: "Import wallets with a 12 word recovery phrase")
                                }
                                NavigationLink(destination: ImportPrivateKeyView()) {
                                    ImportViewCategoryItem(icon: "key.fill", color: Color(Colors.System.orange), title: "With Private Key", description: "Import a wallet by entering its private key.")
                                }
                            }.padding(.top, 8).padding([.leading, .trailing], 16)
                            Spacer()
                        }
                        .navigationBarTitle("Import or Restore Wallet", displayMode: .inline)
                    }) {
                        HStack(spacing: 16) {
                            ColoredIconView(imageName: "square.and.arrow.down", foregroundColor: Color(.white), backgroundColor: Color(Colors.System.blue))
                            Text("Import Existing Wallet")
                                .font(.custom(font: .inter, size: 17, weight: .regular))
                        }
                    }
                }
            }
        }.sheet(isPresented: $isPresentingEditView) {
            Text("Getting Started in Light Wallet")
                .fontWeight(.bold)
                .font(.system(size: 45))
                .padding([.top], 60)
            
            VStack(alignment: .leading) {
                FeatureDetail(image: "safari.fill", title: "Safari Extension", description: "Instant access to all dapps, at the convenience of your fingertips inside the Safari browser.")
                FeatureDetail(image: "lock.shield.fill", title: "Security", description: "Secure your funds & assets using Apple's native Secure Encalve.")
                FeatureDetail(image: "checkmark.seal.fill", title: "Open Source & Native", description: "We believe in a privacy focused, open & transparent, native wallet infrastructure for Ethereum.")
            }
            
            Spacer()
            
            Button(action: {isPresentingEditView=false}){
                Text("Get Started")
                    .foregroundColor(.white)
                    .font(.headline)
                    .font(.system(size: 28))
                    .frame(maxWidth: .infinity, maxHeight: 60.0)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding(.top, 50)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
            }
        }
    }
    
    func createMainWallet()  {
        do {
            try viewModel.createMainWallet()
            AppOrchestra.onboarding()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct FeatureDetail: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .padding(10.0)
                .frame(width: 48, height: 48)
                .foregroundColor(Color(Colors.Background.primary))
                .background(Color(Colors.Label.primary))
                .cornerRadius(.infinity)
                .padding([.top], 2.0)
                .padding([.trailing], 8.0)
            

            VStack(alignment: .leading) {
                Text(title).bold().font(.system(size: 21)).padding([.bottom], 1.0)
                
                Text(description).font(.system(size: 16)).foregroundColor(Color(Colors.Label.secondary))
            }
        
        }.padding([.leading, .trailing], 20.0).padding([.top], 30.0)
    }
}
