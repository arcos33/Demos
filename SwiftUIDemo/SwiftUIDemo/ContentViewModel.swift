import SwiftUI

class ContentViewModel: AnalyticsReporter, ObservableObject {

    // MARK: - Properties

    @Published var listHeight: CGFloat = 50
    @Published var school: School = allSchools

    static var marines = School(name: "Marines", children: nil)
    static var army = School(name: "Army", children: nil)
    static var summitElementary = School(name: "Summit Elementary", children: nil)
    static var summitJRHigh = School(name: "Summit JR High", children: nil)
    static var militarySchools = School(name: "Military Schools", children: [army, navy])
    static var hospital = School(name: "Hospital", children: nil)
    static var navy = School(name: "Navy", children: [army, marines])
    static var charterSchools = School(name: "Charter Schools", children: [summitElementary, summitJRHigh])
    static var preschool = School(name: "preschool", children: nil)
    static var daycare = School(name: "daycare", children: nil)
    static var allSchools = School(name: "All Schools", children: [militarySchools, charterSchools])

    // MARK: - Init

    init() {
        super.init(analyticsTitle: "ny", analyticsURL: "ca")
    }

    // MARK: - Actions

    func updateView() {
        self.objectWillChange.send()
    }
}
