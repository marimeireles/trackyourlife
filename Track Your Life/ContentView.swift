import SwiftUI
import Combine

struct Habit: Identifiable, Codable {
    let id = UUID()
    let name: String
    var isComplete: Bool = false
    let creationDate: Date
}

class HabitViewModel: ObservableObject {
    @Published private(set) var habits: [Habit] = []
    @Published var currentDate: Date = Date()
    
    private let fileName = "habits.json"
    
    init() {
        loadData()
    }
    
    func addHabit(name: String) {
        let newHabit = Habit(name: name, creationDate: currentDate)
        habits.append(newHabit)
        saveData()
    }
    
    func toggleHabitCompletion(habitId: UUID) {
        if let index = habits.firstIndex(where: { $0.id == habitId }) {
            habits[index].isComplete.toggle()
            saveData()
        }
    }
    
    func loadData() {
        let fileManager = FileManager.default
        let documentDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                self.habits = try decoder.decode([Habit].self, from: data)
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(habits)
            let fileManager = FileManager.default
            let documentDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            try data.write(to: fileURL)
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    func habitsForDate(_ date: Date) -> [Habit] {
            return habits.filter {
                Calendar.current.isDate($0.creationDate, inSameDayAs: date) ||
                Calendar.current.compare($0.creationDate, to: date, toGranularity: .day) == .orderedAscending
            }
        }
}

struct ContentView: View {
    @StateObject private var habitViewModel = HabitViewModel()
    @State private var habitName: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: -1, to: self.habitViewModel.currentDate)!
                }) {
                    Image(systemName: "arrow.left")
                }
                
                Text(dateFormatter.string(from: habitViewModel.currentDate))
                
                Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: 1, to: self.habitViewModel.currentDate)!
                }) {
                    Image(systemName: "arrow.right")
                }
            }
            .padding()
            
            HStack {
                TextField("Habit name", text: $habitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add Habit") {
                    if !habitName.isEmpty {
                        habitViewModel.addHabit(name: habitName)
                        habitName = ""
                    }
                }
            }
            .padding()
            
            List {
                ForEach(habitViewModel.habitsForDate(habitViewModel.currentDate)) { habit in
                    HStack {
                        Text(habit.name)
                        Spacer()
                        Image(systemName: habit.isComplete ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                habitViewModel.toggleHabitCompletion(habitId: habit.id)
                            }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}