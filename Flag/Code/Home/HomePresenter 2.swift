import UIKit

public class HomePresenter {

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
