import Domain
import Foundation
import MnemonicSwift

public protocol GenerateMnemonic {
  func get(with strength: Length) throws -> String
}

public final class GenerateMnemonicImp: GenerateMnemonic {

  public init() {}

  public func get(with length: Length) throws -> String {
    try Mnemonic.generateMnemonic(strength: length.strength)
  }
}
