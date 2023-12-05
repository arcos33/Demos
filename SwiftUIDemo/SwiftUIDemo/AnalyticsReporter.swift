import UIKit

class AnalyticsReporter {

    private let analyticsTitle: String
    private let analyticsURL: String

    init(analyticsTitle: String, analyticsURL: String) {
        self.analyticsTitle = analyticsTitle
        self.analyticsURL = analyticsURL

        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// Private methods

private extension AnalyticsReporter {
    @objc func onDidEnterForeground() {

    }

    @objc func onDidEnterBackground() {

    }
}
