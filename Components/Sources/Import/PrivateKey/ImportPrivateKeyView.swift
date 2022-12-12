import Commons
import Foundation
import SPAlert
import SwiftUI
import UIComponents

public struct ImportPrivateKeyView: View {
  @State
  private var text = ""

  @State
  private var showingImport = false

  @StateObject
  var viewModel = ImportPrivateKeyViewModel()

  @Environment(\.presentationMode)
  var presentationMode

  public init() {}

  public var body: some View {
    VStack(spacing: 0) {
      Text("Enter your private key. It is a series of random letter or a list of numbers.")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 14, weight: .regular))
        ._lineHeightMultiple(1.12)
        .foregroundColor(Color(Colors.Label.secondary))
        .padding([.leading, .top, .trailing], 20)
      textField
      Spacer()
      importButton
    }
    .navigationBarTitle("Import with Private Key", displayMode: .inline)
  }

  var textField: some View {
    //        if #available(iOS 16.0, *) {
    //            return ZStack {
    //                TextField("", text: $text, axis: .vertical)
    //                    .multilineTextAlignment(.center)
    //                    .truncationMode(.tail)
    //                    .keyboardType(.alphabet)
    //                    .textInputAutocapitalization(.never)
    //                    .disableAutocorrection(true)
    //                    .font(.system(size: 17, weight: .regular))
    //                    .lineLimit(7)
    //                    .frame(height: 190)
    //                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
    //                    .background(Color(Colors.Background.secondary))
    //                    .clipShape(RoundedRectangle(cornerRadius: 16))
    //                    .padding([.leading, .trailing, .top], 16)
    //                if self.text.isEmpty {
    //                    Text("Paste here or type...")
    //                        .allowsHitTesting(false)
    //                        .foregroundColor(Color(Colors.Label.secondary))
    //                        .padding(.top, 16)
    //                }
    //            }
    //        } else {
    return TextField("Paste here or type...", text: $text)
      .truncationMode(.tail)
      .keyboardType(.alphabet)
      .textInputAutocapitalization(.never)
      .disableAutocorrection(true)
      .font(.system(size: 17, weight: .regular))
      .multilineTextAlignment(.center)
      .frame(height: 190)
      .lineLimit(0)
      .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
      .background(Color(Colors.Background.secondary))
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .padding([.leading, .trailing, .top], 16)
    //        }
  }

  var importButton: some View {
    Button {
      var result = viewModel.importKey(with: ByteArray(hex: text))
      if result {
        AppOrchestra.home()
        showingImport = true
      }
    } label: {
      HStack(spacing: 10) {
        Image(systemName: "square.and.arrow.down")
          .resizable()
          .frame(width: 18, height: 21.5)
          .foregroundColor(Color(Colors.Label.secondary))
        Text("Import")
          .font(.system(size: 17, weight: .semibold))
          .padding(.top, 22)
          .padding(.bottom, 19)
          .foregroundColor(Color(Colors.Label.primary))
      }
      .frame(maxWidth: .infinity)
      .background(Color(Colors.Background.secondary))
      .clipShape(RoundedRectangle(cornerRadius: 14))
      .overlay(
        RoundedRectangle(cornerRadius: 14)
          .stroke(Color(Colors.Separator.transparency), lineWidth: 1)
      )
      .padding(.bottom, 20)
      .padding([.leading, .trailing], 16)
      .SPAlert(
        isPresent: $showingImport,
        title: "Wallet Imported!",
        preset: .done,
        haptic: .success)
    }
  }
}
