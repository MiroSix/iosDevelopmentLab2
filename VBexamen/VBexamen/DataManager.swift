import Foundation

@Observable
class DataManager {
    private var cars = Cars()
     
    init(){
        
    }
    
    func getCars() -> [Car] {
        return cars.cars
    }
    
    func getCarsBySorting(sorting: String) -> [Car] {
        if sorting == "Alle" {
            return cars.cars
        }
        
        var arr: [Car] = []
        
        for car in cars.cars {
            if car.fuelType == sorting {
                arr.append(car)
            }
        }
        
        return arr
    }
    
    private func sort() {
        cars.cars.sort { lhs, rhs in
            lhs.brand.localizedStandardCompare(rhs.brand) == .orderedAscending
        }
    }
    
    
    func loadCars() async {
        do {
            try await Task.sleep(for: .seconds(1))
            //load cars
            cars = load("cars.json")
            sort()
            
        } catch {
            print("Failed to load cars:", error)
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
