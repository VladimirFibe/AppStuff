#  Crypto App SwiftUI

```swift
    @MainActor
    func fetchCoinsAsync() async throws {
        do {
            page += 1
            guard let url = URL(string: urlString) else { throw CoinError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CoinError.serverError }
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { throw CoinError.invalidData }
            self.coins.append(contentsOf: coins)
        } catch {
            self.error = error
        }
    }
```

[How to Network Like A Pro | Async/Await | Pagination | Error Handling](https://youtu.be/ICBc6inTNZQ)

