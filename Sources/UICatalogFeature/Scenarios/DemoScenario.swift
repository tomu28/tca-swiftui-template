import Playbook
import SwiftUI

public struct DemoScenario: ScenarioProvider {
    public init() {}

    public static func addScenarios(into playbook: Playbook) {
        playbook.addScenarios(of: "DemoView") {
            Scenario("DemoView", layout: .fill) {
                DemoView()
            }
        }
    }
}

public struct DemoView: View {
    public init() {}

    public var body: some View {
        Text("Demo View!")
    }
}
