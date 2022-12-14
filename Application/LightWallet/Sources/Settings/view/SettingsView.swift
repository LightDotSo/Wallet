import Commons
import SwiftUI
import UIComponents

public struct SettingsView: View {
  @ObservedObject
  var viewModel = SettingsViewModel()

  @Environment(\.presentationMode)
  var presentationMode

  @State
  private var showingAlert = false

  @State private var selectedOption: Theme = AppTheme.getTheme()

  public init() {}

  public var body: some View {
    NavigationView {
      Form {
        Section {
          NavigationLink(destination: WalletEditView()) {
            HStack(spacing: 16) {
              ColoredIconView(
                imageName: "pencil.circle.fill", foregroundColor: Color(.white),
                backgroundColor: Color(Colors.System.green)
              )
              .frame(width: 30, height: 30)
              Text("Edit")
                .font(.custom(font: .inter, size: 17, weight: .regular))
            }
          }
          NavigationLink(destination: WalletBackupView()) {
            HStack(spacing: 16) {
              ColoredIconView(
                imageName: "arrow.triangle.2.circlepath.circle.fill",
                foregroundColor: Color(.white), backgroundColor: Color(Colors.System.orange))
              Text("Backup")
                .font(.custom(font: .inter, size: 17, weight: .regular))
            }
          }
          NavigationLink(
            destination: VStack {
              Form {
                Picker("App Theme", selection: $selectedOption) {
                  ForEach(Theme.allCases, id: \.self) {
                    option in Text(option.description)
                  }
                }
                .pickerStyle(.inline)
                .onChange(
                  of: selectedOption
                ) { option in
                  print(option)
                  UserDefaults.standard.set(option.rawValue, forKey: "AppTheme")
                  NotificationCenter.default.post(
                    name: .changeAppTheme, object: nil)
                }
              }
            }
          ) {
            HStack(spacing: 16) {
              ColoredIconView(
                imageName: "paintpalette.fill", foregroundColor: Color(.white),
                backgroundColor: Color(Colors.System.purple))
              Text("App Theme")
                .font(.custom(font: .inter, size: 17, weight: .regular))
            }
          }
        } header: {
          Text("Preferences".uppercased())
            .font(.system(size: 12, weight: .medium))
        }
        .padding([.top, .bottom], 2.5)
        .textCase(nil)
        Section {
          HStack(spacing: 16) {
            ColoredIconView(
              imageName: "doc.plaintext.fill", foregroundColor: Color(.white),
              backgroundColor: Color(.gray))
            Link(
              "Terms of Conditions",
              destination: URL(
                string: "https://lightdotso.notion.site/38d646143772410887a0e6cae3ee0e56")!
            )
            .foregroundColor(Color(Colors.Label.primary))
            .font(.custom(font: .inter, size: 17, weight: .regular))
          }
          HStack(spacing: 16) {
            ColoredIconView(
              imageName: "hand.raised.circle", foregroundColor: Color(.white),
              backgroundColor: Color(Colors.System.purple))
            Link(
              "Privacy Policy",
              destination: URL(
                string: "https://lightdotso.notion.site/81dbf21d7bca4b9285a13392edbf575e")!
            )
            .foregroundColor(Color(Colors.Label.primary))
            .font(.custom(font: .inter, size: 17, weight: .regular))
          }
          HStack(spacing: 16) {
            ColoredIconView(
              imageName: "questionmark.circle", foregroundColor: Color(.white),
              backgroundColor: Color(Colors.System.blue))
            Link(
              "FAQ",
              destination: URL(
                string: "https://lightdotso.notion.site/d9a70e761b9e4290bc2b8e58cd71a70c")!
            )
            .foregroundColor(Color(Colors.Label.primary))
            .font(.custom(font: .inter, size: 17, weight: .regular))
          }
          HStack(spacing: 16) {
            Image("TwitterSettingsIcon")
            Link(
              "Follow @Light_Wallet", destination: URL(string: "https://twitter.com/Light_Wallet")!
            )
            .foregroundColor(Color(Colors.Label.primary))
            .font(.custom(font: .inter, size: 17, weight: .regular))
          }
        } header: {
          Text("Resources".uppercased())
            .font(.system(size: 12, weight: .medium))
        }
        .padding([.top, .bottom], 2.5)
        .textCase(nil)
        Section {
          NavigationLink(
            destination: VStack(spacing: 0) {
              Form {
                Section {
                  Button(action: { self.showingAlert.toggle() }) {
                    Text("Delete All Wallets")
                      .foregroundColor(Color(Colors.Label.primary))
                      .font(.custom(font: .inter, size: 17, weight: .regular))
                  }
                  .confirmationDialog(
                    "Are you sure you want to delete all wallets?",
                    isPresented: $showingAlert
                  ) {
                    Button("Delete All Wallets", role: .destructive) {
                      self.deleteWallets()
                    }
                  }
                }
              }
            }
          ) {
            HStack(spacing: 16) {
              ColoredIconView(
                imageName: "exclamationmark.octagon.fill", foregroundColor: Color(.white),
                backgroundColor: Color(Colors.System.red)
              )
              .frame(width: 30, height: 30)
              Text("Advanced")
                .font(.custom(font: .inter, size: 17, weight: .regular))
            }
          }

        } header: {
          Text("DEVELOPMENT".uppercased())
            .font(.system(size: 12, weight: .medium))
        }
      }
      .padding(.top, -18)
      .navigationBarTitle("Settings", displayMode: .inline)
      .toolbar { CloseToolbar { presentationMode.wrappedValue.dismiss() } }
      Spacer()
    }
  }

  func deleteWallets() {
    AppOrchestra.onboarding()
    DispatchQueue.main.asyncAfter(deadline: .now()) {
      do {
        try viewModel.deleteAllAccounts()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}
