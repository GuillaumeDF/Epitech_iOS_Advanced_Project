import UIKit
import FirebaseAnalytics
import FirebaseCrashlytics
import Firebase
import Home

public class Home: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    public var viewModel: HomeViewModel!
    public var router: HomeViewRouting!
    public var presenter: HomePresenter!
    
    public var textColor: UIColor! = UIColor.black
    
    var remoteConfig: RemoteConfig!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        remoteConfig = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
            settings.minimumFetchInterval = 0
            remoteConfig.configSettings = settings
        
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        fetchConfig()
        
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
    
    func fetchConfig() {
        remoteConfig.fetch() { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            let remoteConfigTextColor = self.remoteConfig["textColorBlack"].stringValue!
            
            if (remoteConfigTextColor == "false") {
                self.textColor = UIColor.red
                self.tableView.reloadData()
            }
            self.remoteConfig.activate() { (changed, error) in
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
        }
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
        let view = router.getDetail(country: country, textColor: self.textColor)
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

        cell.configure(with: viewModel.countries[indexPath.row], textColor: self.textColor)
        return cell
    }
}
