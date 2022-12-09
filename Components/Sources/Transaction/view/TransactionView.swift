import Commons
import SDWebImageSwiftUI
import SwiftUI
import TransactionServices
import UIComponents

public struct TransactionView: View {
  @ObservedObject
  var viewModel: TransactionViewModel

  @Environment(\.presentationMode)
  var presentationMode

  public init(
    viewModel: TransactionViewModel
  ) {
    self.viewModel = viewModel
  }
  public var body: some View {
    VStack {
      if viewModel.transactions.count > 0 {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 0) {
            ForEach(viewModel.transactions) { asset in
              TransactionItem(transaction: asset)
                .frame(height: 64.5)
              Rectangle()
                .fill(.white.opacity(0.12))
                .frame(height: 0.5)
            }
            .background(Color(Colors.Background.secondary))
          }
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .padding(.top, 15)
        }
        .padding(.horizontal, 10)
      } else {
        Text("Transactions Empty")
      }
    }
    .background(Color(Colors.Background.secondary))
  }
}