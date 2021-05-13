import UIKit

public class HomeCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var flagImageView: UIImageView!
    
    public func configure(with country: Country, textColor: UIColor) {
        titleLabel.text = country.name
        flagImageView.image = country.flagAsset
        titleLabel.textColor = textColor
    }
}
