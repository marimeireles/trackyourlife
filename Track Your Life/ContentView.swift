import SwiftUI
import Combine

struct Habit: Identifiable, Codable {
    let id = UUID()
    var name: String
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
        print("☀️☀️☀️")
        saveData()
    }
    
    func deleteHabit(habitId: UUID) {
           if let index = habits.firstIndex(where: { $0.id == habitId }) {
               habits.remove(at: index)
           }
       }

       func editHabit(habitId: UUID, newName: String) {
           if let index = habits.firstIndex(where: { $0.id == habitId }) {
               habits[index].name = newName
               saveData()
           }
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

struct EditHabitAlert: View {
    @Binding var isPresented: Bool
    @Binding var habitName: String
    var onSave: () -> Void

    var body: some View {
        VStack {
            Text("Edit Habit")
                .font(.headline)
            TextField("Habit name", text: $habitName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack {
                Button("Save") {
                    onSave()
                    isPresented = false
                }
                Button("Cancel") {
                    isPresented = false
                }
            }
        }
        .padding()
    }
}


struct ContentView: View {
    @StateObject private var habitViewModel = HabitViewModel()
    @State private var habitName: String = ""
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var showEditAlert: Bool = false
    @State private var selectedHabitId: UUID?
    @State private var editedHabitName: String = ""
    
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
                            .onTapGesture {
                                print("☀️☀️☀️")
                                self.selectedHabitId = habit.id
                                self.editedHabitName = habit.name
                                self.showEditAlert = true
                            }
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
            .sheet(isPresented: $showEditAlert) {
                EditHabitAlert(isPresented: self.$showEditAlert, habitName: self.$editedHabitName) {
                    if let habitId = self.selectedHabitId {
                        self.habitViewModel.editHabit(habitId: habitId, newName: self.editedHabitName)
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
