import Commons
import Foundation
import Generated
import SDWebImageSVGCoder
import SnapKit
import UIKit

public final class SplashViewController: UIViewController {

  private let viewModel: SplashViewModel

  private let logoImage: UIImageView = UIImageView()

  init(viewModel: SplashViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    styleUI()
    layoutUI()

    helpers()
    viewModel.invoke()
    print(rustGreeting(name: "Bob"))
    print(
      Constants.CF_BUNDLE_NAME
    )
    print(Constants.APP_ACCESS_GROUP)
    print(Constants.APP_GROUP_IDENTIFIER)
  }
}

// MARK: - Helpers
extension SplashViewController {
  private func helpers() {
    let SVGCoder = SDImageSVGCoder.shared
    SDImageCodersManager.shared.addCoder(SVGCoder)
  }
}

// MARK: - UI
extension SplashViewController {
  func setupUI() {
    view.addSubview(logoImage)
    logoImage.image = UIImage(named: "LogoIcon")
    logoImage.layer.masksToBounds = true
  }
  func styleUI() {

  }
  func layoutUI() {
    logoImage.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(120)
    }
  }
}
