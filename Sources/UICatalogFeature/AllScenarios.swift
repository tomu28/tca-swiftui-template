import Playbook

public struct AllScenarios: ScenarioProvider {
    public init() {}

    public static func addScenarios(into playbook: Playbook) {
        playbook
            .add(DemoScenario.self)
    }
}
