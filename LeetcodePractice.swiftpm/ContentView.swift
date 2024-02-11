import SwiftUI

struct ContentView: View {
    @StateObject private var solution = Solution()
    var body: some View {
        Button("Reload") {
            print("Solving now!!")
//            solution.solve()
        }
    }
}
