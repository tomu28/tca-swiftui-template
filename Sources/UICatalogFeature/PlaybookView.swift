import PlaybookUI
import SwiftUI

public struct UICatalogView: View {
    public init() {
        Playbook.default.add(AllScenarios.self)
    }

    public var body: some View {
        PlaybookGallery()
    }
}
