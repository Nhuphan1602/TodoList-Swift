//
//  TaskCell.swift
//  TodoList
//
//  Created by Phan Tam Nhu on 14/6/24.
//

import SwiftUI

struct TaskCellView: View {
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    
    var body: some View {
        HStack {
            CheckBoxView(passedTaskItem: passedTaskItem)
                .environmentObject(dateHolder)
            
            Text(passedTaskItem.name ?? "")
                .padding(.horizontal)
            
            if !passedTaskItem.isCompleted() && passedTaskItem.scheduleTime {
                Spacer()
                Text(passedTaskItem.dueDateTimeOnly())
                    .font(.footnote)
                    .foregroundColor(passedTaskItem.overDueColor())
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TaskCellView(passedTaskItem: TaskItem())
}
