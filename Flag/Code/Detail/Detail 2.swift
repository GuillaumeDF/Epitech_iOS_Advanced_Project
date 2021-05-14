import UIKit

public class Detail: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!

    public var viewModel: DetailViewModel!

    override public func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = viewModel.image
        textLabel.text = viewModel.text
    }
}
