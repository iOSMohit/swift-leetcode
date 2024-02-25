import SwiftUI

struct ContentView: View {
    @StateObject private var solution = Solution()
    private var lru = LRUCache(4)
    var body: some View {
        Button("Reload") {
//            print("Solving now!!")
//            solution.solve()
            solution.printLRU()
        }
    }
}
