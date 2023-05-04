@_private(sourceFile: "ContentView.swift") import Track_Your_Life
import Combine
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 132)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 82)
        VStack {
            HStack {
                Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: -__designTimeInteger("#4841.[4].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].[0]", fallback: 1), to: self.habitViewModel.currentDate)!
                }) {
                    Image(systemName: __designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "arrow.left"))
                }
                
                Text(dateFormatter.string(from: habitViewModel.currentDate))
                
                Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: __designTimeInteger("#4841.[4].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].[0]", fallback: 1), to: self.habitViewModel.currentDate)!
                }) {
                    Image(systemName: __designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "arrow.right"))
                }
            }
            .padding()
            
            HStack {
                TextField(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Habit name"), text: $habitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: "Add Habit")) {
                    if !habitName.isEmpty {
                        habitViewModel.addHabit(name: habitName)
                        habitName = __designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].[0].[1].[0]", fallback: "")
                    }
                }
            }
            .padding()
            
            List {
                ForEach(habitViewModel.habitsForDate(habitViewModel.currentDate)) { habit in
                    HStack {
                        Text(habit.name)
                        Spacer()
                        Image(systemName: habit.isComplete ? __designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.then", fallback: "checkmark.circle.fill") : __designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.else", fallback: "circle"))
                            .resizable()
                            .frame(width: __designTimeInteger("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 24), height: __designTimeInteger("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 24))
                            .onTapGesture {
                                habitViewModel.toggleHabitCompletion(habitId: habit.id)
                            }
                    }
                }
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: dateFormatter) private var __preview__dateFormatter: DateFormatter {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 76)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: habitsForDate(_:)) private func __preview__habitsForDate(_ date: Date) -> [Habit] {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 64)
            return habits.filter {
                Calendar.current.isDate($0.creationDate, inSameDayAs: date) ||
                Calendar.current.compare($0.creationDate, to: date, toGranularity: .day) == .orderedAscending
            }
        
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: saveData()) private func __preview__saveData() {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 51)
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
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: loadData()) private func __preview__loadData() {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 35)
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
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: toggleHabitCompletion(habitId:)) private func __preview__toggleHabitCompletion(habitId: UUID) {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 28)
        if let index = habits.firstIndex(where: { $0.id == habitId }) {
            habits[index].isComplete.toggle()
            saveData()
        }
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: addHabit(name:)) private func __preview__addHabit(name: String) {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 22)
        let newHabit = Habit(name: name, creationDate: currentDate)
        habits.append(newHabit)
        saveData()
    
#sourceLocation()
    }
}

import struct Track_Your_Life.Habit
import class Track_Your_Life.HabitViewModel
import struct Track_Your_Life.ContentView
import struct Track_Your_Life.ContentView_Previews

