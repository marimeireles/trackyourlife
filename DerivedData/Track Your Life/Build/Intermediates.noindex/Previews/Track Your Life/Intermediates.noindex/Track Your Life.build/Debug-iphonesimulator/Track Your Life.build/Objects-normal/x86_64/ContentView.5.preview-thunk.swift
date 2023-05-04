@_private(sourceFile: "ContentView.swift") import Track_Your_Life
import Combine
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 190)
        __designTimeSelection(ContentView(), "#4841.[6].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 127)
        __designTimeSelection(VStack {
            __designTimeSelection(HStack {
                __designTimeSelection(Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: -__designTimeInteger("#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].[0]", fallback: 1), to: self.habitViewModel.currentDate)!
                }) {
                    __designTimeSelection(Image(systemName: __designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "arrow.left")), "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0]")
                }, "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                
                __designTimeSelection(Text(__designTimeSelection(dateFormatter.string(from: __designTimeSelection(habitViewModel.currentDate, "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.modifier[0].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[1]")
                
                __designTimeSelection(Button(action: {
                    self.habitViewModel.currentDate = Calendar.current.date(byAdding: .day, value: __designTimeInteger("#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].[0]", fallback: 1), to: self.habitViewModel.currentDate)!
                }) {
                    __designTimeSelection(Image(systemName: __designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "arrow.right")), "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[1].value.[0]")
                }, "#4841.[5].[8].property.[0].[0].arg[0].value.[0].arg[0].value.[2]")
            }
            .padding(), "#4841.[5].[8].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(HStack {
                __designTimeSelection(TextField(__designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Habit name"), text: __designTimeSelection($habitName, "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value"))
                    .textFieldStyle(__designTimeSelection(RoundedBorderTextFieldStyle(), "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0]")
                __designTimeSelection(Button(__designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: "Add Habit")) {
                    if !habitName.isEmpty {
                        __designTimeSelection(habitViewModel.addHabit(name: __designTimeSelection(habitName, "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].[0].[0].modifier[0].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].[0].[0]")
                        habitName = __designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].[0].[1].[0]", fallback: "")
                    }
                }, "#4841.[5].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1]")
            }
            .padding(), "#4841.[5].[8].property.[0].[0].arg[0].value.[1]")
            
            
            __designTimeSelection(List {
                        __designTimeSelection(ForEach(__designTimeSelection(habitViewModel.habitsForDate(__designTimeSelection(habitViewModel.currentDate, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.modifier[0].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value")) { habit in
                            __designTimeSelection(HStack {
                                __designTimeSelection(Text(__designTimeSelection(habit.name, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].arg[0].value"))
                                    .onLongPressGesture {
                                        self.selectedHabitId = habit.id
                                        self.editedHabitName = habit.name
                                        self.showEditAlert = true
                                    }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0]")
                                __designTimeSelection(Spacer(), "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[1]")
                                __designTimeSelection(Image(systemName: __designTimeSelection(habit.isComplete, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.if") ? __designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.then", fallback: "checkmark.circle.fill") : __designTimeString("#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].arg[0].value.else", fallback: "circle"))
                                    .resizable()
                                    .frame(width: __designTimeInteger("#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 24), height: __designTimeInteger("#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 24))
                                    .onTapGesture {
                                        __designTimeSelection(habitViewModel.toggleHabitCompletion(habitId: __designTimeSelection(habit.id, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[2].arg[0].value.[0].modifier[0].arg[0].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2].modifier[2].arg[0].value.[0]")
                                    }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[2]")
                            }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0]")
                        }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].arg[0].value.[0]")
                    }
                    .sheet(isPresented: __designTimeSelection($showEditAlert, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value")) {
                        __designTimeSelection(EditHabitAlert(isPresented: __designTimeSelection(self.$showEditAlert, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0].arg[0].value"), habitName: __designTimeSelection(self.$editedHabitName, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0].arg[1].value")) {
                            if let habitId = self.selectedHabitId {
                                __designTimeSelection(self.habitViewModel.editHabit(habitId: __designTimeSelection(habitId, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0].arg[2].value.[0].[0].[0].modifier[0].arg[0].value"), newName: __designTimeSelection(self.editedHabitName, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0].arg[2].value.[0].[0].[0].modifier[0].arg[1].value")), "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0].arg[2].value.[0].[0].[0]")
                            }
                        }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2].modifier[0].arg[1].value.[0]")
                    }, "#4841.[5].[8].property.[0].[0].arg[0].value.[2]")
        }, "#4841.[5].[8].property.[0].[0]")
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: dateFormatter) private var __preview__dateFormatter: DateFormatter {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 121)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return __designTimeSelection(formatter, "#4841.[5].[7].property.[0].[2]")
    
#sourceLocation()
    }
}

extension EditHabitAlert {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 90)
        __designTimeSelection(VStack {
            __designTimeSelection(Text(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Edit Habit"))
                .font(.headline), "#4841.[4].[3].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(TextField(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Habit name"), text: __designTimeSelection($habitName, "#4841.[4].[3].property.[0].[0].arg[0].value.[1].arg[1].value"))
                .textFieldStyle(__designTimeSelection(RoundedBorderTextFieldStyle(), "#4841.[4].[3].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value"))
                .padding(), "#4841.[4].[3].property.[0].[0].arg[0].value.[1]")
            __designTimeSelection(HStack {
                __designTimeSelection(Button(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: "Save")) {
                    __designTimeSelection(onSave(), "#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0]")
                    isPresented = false
                }, "#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0]")
                __designTimeSelection(Button(__designTimeString("#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: "Cancel")) {
                    isPresented = false
                }, "#4841.[4].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[1]")
            }, "#4841.[4].[3].property.[0].[0].arg[0].value.[2]")
        }
        .padding(), "#4841.[4].[3].property.[0].[0]")
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: habitsForDate(_:)) private func __preview__habitsForDate(_ date: Date) -> [Habit] {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 77)
            return __designTimeSelection(habits.filter {
                Calendar.current.isDate($0.creationDate, inSameDayAs: date) ||
                Calendar.current.compare($0.creationDate, to: date, toGranularity: .day) == .orderedAscending
            }, "#4841.[3].[10].[0]")
        
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: saveData()) private func __preview__saveData() {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 64)
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
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 48)
        let fileManager = FileManager.default
        let documentDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentDirectory.appendingPathComponent(__designTimeSelection(fileName, "#4841.[3].[8].[2].value.modifier[0].arg[0].value"))
        
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
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 41)
        if let index = habits.firstIndex(where: { $0.id == habitId }) {
            habits[index].isComplete.toggle()
            __designTimeSelection(saveData(), "#4841.[3].[7].[0].[0].[1]")
        }
    
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: editHabit(habitId:newName:)) private func __preview__editHabit(habitId: UUID, newName: String) {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 34)
           if let index = habits.firstIndex(where: { $0.id == habitId }) {
               habits[index].name = newName
               __designTimeSelection(saveData(), "#4841.[3].[6].[0].[0].[1]")
           }
       
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: deleteHabit(habitId:)) private func __preview__deleteHabit(habitId: UUID) {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 28)
           if let index = habits.firstIndex(where: { $0.id == habitId }) {
               __designTimeSelection(habits.remove(at: __designTimeSelection(index, "#4841.[3].[5].[0].[0].[0].modifier[0].arg[0].value")), "#4841.[3].[5].[0].[0].[0]")
           }
       
#sourceLocation()
    }
}

extension HabitViewModel {
    @_dynamicReplacement(for: addHabit(name:)) private func __preview__addHabit(name: String) {
        #sourceLocation(file: "/Users/mariana/dev/Track Your Life/Track Your Life/ContentView.swift", line: 22)
        let newHabit = Habit(name: __designTimeSelection(name, "#4841.[3].[4].[0].value.arg[0].value"), creationDate: __designTimeSelection(currentDate, "#4841.[3].[4].[0].value.arg[1].value"))
        __designTimeSelection(habits.append(__designTimeSelection(newHabit, "#4841.[3].[4].[1].modifier[0].arg[0].value")), "#4841.[3].[4].[1]")
        __designTimeSelection(saveData(), "#4841.[3].[4].[2]")
    
#sourceLocation()
    }
}

import struct Track_Your_Life.Habit
import class Track_Your_Life.HabitViewModel
import struct Track_Your_Life.EditHabitAlert
import struct Track_Your_Life.ContentView
import struct Track_Your_Life.ContentView_Previews

