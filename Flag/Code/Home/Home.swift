import UIKit
import FirebaseAnalytics
import FirebaseCrashlytics

public class Home: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var viewModel: HomeViewModel!
    public var router: HomeViewRouting!
    public var presenter: HomePresenter!

    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchFlags { [weak self] viewModel in
            self?.viewModel = viewModel
            self?.tableView.reloadData()
        }
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        Analytics.logEvent("firebaseAnalytics",
                           parameters: [
                            "view": "Home",
                            "event": "viewWillAppear"
                           ])
        //let trace = Performance.startTrace(name: "CUSTOM_TRACE_NAME")

    }
}

extension Home: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.countries[indexPath.row]
        let view = router.getDetail(country: country)
        Analytics.logEvent("firebaseAnalytics",
                           parameters: [
                            "view": "Home",
                            "event": "onFlagSelection",
                            "selectedFlag": country.name
                           ])
        navigationController?.pushViewController(view, animated: true)
    }
}

extension Home: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countries.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HomeCell else {
            fatalError("Could not dequeue reusable cell \(cellIdentifier)")
        }

        cell.configure(with: viewModel.countries[indexPath.row])
        return cell
    }
}
