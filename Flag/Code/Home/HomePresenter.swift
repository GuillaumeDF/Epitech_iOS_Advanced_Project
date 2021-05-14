import UIKit
import Core
import Home

public class HomePresenter {
    
    public init() {}

    public func fetchFlags(onCompletion: (HomeViewModel) -> Void) {
        
        var allCoutries: [Country] = []
        let allImages = Asset.allImages
        
        for image in allImages {
            allCoutries.append(Country(flagAsset: image.image as UIImage, name: String(image.name.dropLast(5)).capitalized))
        }
        
        print(allCoutries)
        let viewModel = HomeViewModel(
            countries: allCoutries
        )
        onCompletion(viewModel)
    }
}
