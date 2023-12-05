import SwiftUI

struct ScrollToView: View {
    @State private var value1: String = ""
    @State private var value2: String = ""
    @State private var value3: String = ""
    @State private var value4: String = ""
    @State private var value5: String = ""
    @State private var value6: String = ""
    @State private var value7: String = ""
    @State private var value8: String = ""
    @State private var value9: String = ""
    @State private var value10: String = ""
    @State private var value11: String = ""
    @State private var value12: String = ""
    @State private var value13: String = ""
    @State private var value14: String = ""
    @State private var value15: String = ""
    @State private var value16: String = ""
    @State private var value17: String = ""
    @State private var value18: String = ""
    @State private var value19: String = ""
    @State private var value20: String = ""
    @State private var value21: String = ""
    @State private var value22: String = ""
    @State private var value23: String = ""
    @State private var value24: String = ""

    @State private var textId: UUID?

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Rectangle()
                    .frame(height: 200)
                    .background(Color.red)
                    .id(textId)
                Rectangle()
                    .frame(height: 200)
                    .background(Color.red)
                Rectangle()
                    .frame(height: 200)
                    .background(Color.red)
                Rectangle()
                    .frame(height: 200)
                    .background(Color.red)
                TextField("Field 1", text: self.$value1, onEditingChanged: { _ in
                })
                TextField("Field 2", text: self.$value2, onEditingChanged: { _ in
                })
                TextField("Field 3", text: self.$value3, onEditingChanged: { _ in
                })
                TextField("Field 4", text: self.$value4, onEditingChanged: { _ in
                })
                TextField("Field 5", text: self.$value5, onEditingChanged: { _ in
                })
                TextField("Field 6", text: self.$value6, onEditingChanged: { _ in
                })
                TextField("Field 7", text: self.$value7, onEditingChanged: { _ in
                })
                TextField("Field 8", text: self.$value8, onEditingChanged: { _ in
                })
                TextField("Field 9", text: self.$value9, onEditingChanged: { _ in
                })
                TextField("Field 10", text: self.$value10, onEditingChanged: { _ in
                })
                TextField("Field 11", text: self.$value11, onEditingChanged: { _ in
                })
                TextField("Field 12", text: self.$value12, onEditingChanged: { _ in
                })
                TextField("Field 13", text: self.$value13, onEditingChanged: { _ in
                })
                TextField("Field 14", text: self.$value14, onEditingChanged: { _ in
                })
                TextField("Field 15", text: self.$value15, onEditingChanged: { _ in
                })
                TextField("Field 16", text: self.$value16, onEditingChanged: { _ in
                })
                TextField("Field 17", text: self.$value17, onEditingChanged: { _ in
                })
                TextField("Field 18", text: self.$value18, onEditingChanged: { _ in
                })
                TextField("Field 19", text: self.$value19, onEditingChanged: { _ in
                })
                TextField("Field 20", text: self.$value20, onEditingChanged: { _ in
                })
                TextField("Field 21", text: self.$value21, onEditingChanged: { _ in
                })
                TextField("Field 22", text: self.$value22, onEditingChanged: { _ in
                })
                TextField("Field 23", text: self.$value23, onEditingChanged: { _ in
                })
                TextField("Field 24", text: self.$value24, onEditingChanged: { _ in
                    proxy.scrollTo(textId)
                })
            }
            .ignoresSafeArea(.keyboard)
        }
        .ignoresSafeArea(.keyboard)
    }
}
