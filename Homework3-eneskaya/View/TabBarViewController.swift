//
//  TabBarViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit
import CoreData

//tab bar view controller
class TabBarViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    var List: [NSManagedObject] = []
    var choosenTodoItem = TodoEntity()
    var choosenTodo = ""
    var choosenisChecked : Bool = false
    var detailInfo = false
    var todos = [TodoEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CoreData To Do List"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        getAllItem()

        
        // Do any additional setup after loading the view.
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        
        

    }
   

    
    func getAllItem() {
        
        todos.removeAll(keepingCapacity: false)
            
          do {
            
            todos = try context.fetch(TodoEntity.fetchRequest())
            DispatchQueue.main.async {
               
                self.tableView.reloadData()
            }
           
        }
        catch {
          //error
        }
    }
    
    func createAnItem(name: String) {
        let newItem = TodoEntity(context: context)
        newItem.todo = name
        newItem.created = Date()
        newItem.isChecked = false
        do{
            try context.save()
        }
        catch{
            // error
        }
    }
    
    func updateItem(item: TodoEntity){
        
        item.isChecked = true
        
        do{
            try context.save()
        }
        catch{
            // error
        }
        
   
        
    }
    
    @IBAction func addButonClicked(_ sender: Any) {
        
    }
    
    
    
    // Tableview section Todos and Done Todos
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let model = todos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell",for: indexPath) as! TodoCell
        
        cell.todoLabel.text = model.todo
        cell.checkmarkImage.image = UIImage(named: "checkmark.png")
        
        cell.isChecked = model.isChecked
        
        if cell.isChecked == true {
          
            cell.checkmarkImage.image = UIImage(named: "checkmarkfill.png")
           
        }
        else{
           
            cell.checkmarkImage.image = UIImage(named: "checkmark.png")
           
        }
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = .lightGray
        }
        else{
            cell.contentView.backgroundColor = .white
        }
        
        
        
        
        return cell
    }
  
      
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        let model = todos[indexPath.row]
        self.choosenTodo = model.todo ?? "todo"
        
        choosenisChecked = cell.isChecked
        choosenTodoItem = model
        
     
        performSegue(withIdentifier: "toTodoDetailVC", sender: nil)
    
    
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
        if segue.identifier == "toTodoDetailVC"{
        let destinationVC = segue.destination as! TodoDetailViewController // artık bu yapıya ait tüm
            destinationVC.selectedText = choosenTodo
            destinationVC.selectedIsChecked = choosenisChecked
            destinationVC.selectedTodo = choosenTodoItem
            
    
            
            
        }}
   
        
        
    
    
  
       
    
    

}
