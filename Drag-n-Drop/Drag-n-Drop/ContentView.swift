//
//  ContentView.swift
//  Drag-n-Drop
//
//  Created by Jaimin Raval on 06/09/23.
//

import SwiftUI
import Algorithms

struct ContentView: View {
//    Three list for 3 sections of our Kanban board. first one is with some dummy data
    @State private var toDoList: [String] = ["@Observable Migration", "Migrate to Swift Data", "UIKit is still cool", "CoreAnimation"]
    @State private var inProgressList: [String] = []
    @State private var completedList: [String] = []
    
//    used for background highliting indicator
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false
    
    var body: some View {
        HStack(spacing: 12) {
            KanbanView(title: "ToDo", tasks: toDoList, isTargeted: isToDoTargeted)
//            this attribute .dropDestination helps us to decide where our draged item should be good to be dropped
                .dropDestination(for: String.self) { droppedTasks, location in
                    
                    for task in droppedTasks {
                        inProgressList.removeAll {$0 == task}
                        completedList.removeAll {$0 == task}
                    }
                    
                    let totalTasks = toDoList + droppedTasks
                    toDoList = Array(totalTasks.uniqued())
                    return true
                    
                } isTargeted: { isTargeted in
                    isToDoTargeted = isTargeted
                }
            
            KanbanView(title: "In Progress", tasks: inProgressList, isTargeted: isInProgressTargeted)
                .dropDestination(for: String.self) { droppedTasks, location in
                    
                    for task in droppedTasks {
                        toDoList.removeAll {$0 == task}
                        completedList.removeAll {$0 == task}
                    }
                    
                    let totalTasks = inProgressList + droppedTasks
                    inProgressList = Array(totalTasks.uniqued())
                    return true
                    
                } isTargeted: { isTargeted in
                    isInProgressTargeted = isTargeted
                }
            
            KanbanView(title: "Completed", tasks: completedList, isTargeted: isDoneTargeted)
                .dropDestination(for: String.self) { droppedTasks, location in
                    
                    for task in droppedTasks {
                        toDoList.removeAll {$0 == task}
                        inProgressList.removeAll {$0 == task}
                    }
                    
                    let totalTasks = completedList + droppedTasks
                    completedList = Array(totalTasks.uniqued())
                    return true
                    
                } isTargeted: { isTargeted in
                    isDoneTargeted = isTargeted
                }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct KanbanView: View {
    
    let title: String
    let tasks: [String]
    let isTargeted: Bool
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? .teal.opacity(0.15) : Color(.secondarySystemFill))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
//                        this line of code enable us to make objects to be draggable
                            .draggable(task)
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
