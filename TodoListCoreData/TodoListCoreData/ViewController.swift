//
//  ViewController.swift
//  TodoListCoreData
//
//  Created by Zülal Nebin on 4.11.2026.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create
        addTodo(title: "title 1", content: "content 1")

        // Read
        getTodos()

        // Update
        updateTodos()

        // Read
        getTodos()

        // Delete
        deleteTodos()

        // Read
        getTodos()
        
    }
    
    func addTodo(title: String, content: String) {
        let context = fetchContext()
        let entity = NSEntityDescription.entity(forEntityName: "Todo", in: context)
        
        let todo = NSManagedObject(entity: entity!, insertInto: context)
        
        todo.setValue(title, forKey: "title")
        todo.setValue(content, forKey: "content")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func getTodos() {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        // fetchRequest.predicate = NSPredicate(format: "title contains 1")
        // fetchRequest.predicate = NSPredicate(format: "title = %@", "title 2")
        // fetchRequest.predicate = NSPredicate(format: "title = %@ and content = %@", "title 7", "content 8")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        do {
            let todoList = try fetchContext().fetch(fetchRequest)
            
            for todo in todoList {
                print("Başlık: \(todo.title!) İçerik: \(todo.content!)")
            }
        } catch {
            print("Hata oluştur")
        }
    }
    
    func getTodos(title: String) -> [Todo]? {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "title = %@", title)
        
        do {
            return try fetchContext().fetch(fetchRequest)
            
        } catch {
            print("Hata oluştur")
        }
        
        return nil
    }
    
    func updateTodos() {
        if let todos = getTodos(title: "title 1") {
            for todo in todos {
                todo.title = "title edit"
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    func deleteTodos() {
        if let todos = getTodos(title: "title edit") {
            for todo in todos {
                fetchContext().delete(todo)
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    
    func fetchContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
}

