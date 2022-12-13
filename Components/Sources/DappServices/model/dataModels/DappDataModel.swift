import Foundation

public struct DappDataModel: Decodable {
  public let bridge: [Dapp]
  public let mint: [Dapp]
  public let nft: [Dapp]
  public let swap: [Dapp]

  public struct Dapp: Decodable {
    public let name: String
    public let icon: String
    public let site: String
  }

  public init() {
    self.bridge = []
    self.mint = []
    self.nft = []
    self.swap = []
  }
}
