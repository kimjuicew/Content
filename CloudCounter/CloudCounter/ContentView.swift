import SwiftUI

struct ContentView: View {

    @StateObject private var model: CounterModel = CounterModel()
    @State private var didConfirm: Bool = false

    var body: some View {
        VStack(spacing: 24) {

            Text("Will you be my prom date? 💌✨")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

           
            if didConfirm {
                if model.isEven() {
                    Text("Yessssssss 💖✨ 😊")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                } else {
                    Text("Whyyyyyyyy 😢🌧")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                }
            } else {
                Text(model.isEven() ? "Yes 💖✨" : "No 😢🌧")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
            }

            HStack(spacing: 16) {

                Button("No 😢") {
                    model.decrement()
                    didConfirm = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.gray)

                Button("Yes 💖") {
                    model.increment()
                    didConfirm = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
            }

            Button("Confirm ✅") {
                didConfirm = true
            }
            .buttonStyle(.borderedProminent)

            Button("Ask Again 🔄") {
                model.reset()
                didConfirm = false
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
