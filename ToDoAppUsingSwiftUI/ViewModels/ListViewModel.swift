//
//  ListViewModel.swift
//  ToDoAppUsingSwiftUI
//
//  Created by Code with Shamshad on 12/12/23.
//

import Foundation

/*
 CRUD Functions

 Create
 Read
 Update
 Delete

 */

class ListViewModel: ObservableObject {

    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKeys: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKeys),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKeys)
        }
    }

}
