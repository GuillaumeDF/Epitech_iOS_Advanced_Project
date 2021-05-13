import UIKit
import Core
import Home

public class HomePresenter {
    
    public init() {}

    public func fetchFlags(onCompletion: (HomeViewModel) -> Void) {
        let viewModel = HomeViewModel(
            countries: [
                Country(flagAsset: UIImage(named: "france-flag")!, name: "france")
                // Add others
            ]
        )
        onCompletion(viewModel)
    }
}
