//
//  TodoDetailViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit
import CoreData

// Todo Detail View

class TodoDetailViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var todoText: UILabel!
    var selectedIsChecked : Bool = false
    var selectedText = ""
    var selectedTodo = TodoEntity()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        

       
    }
    override func viewWillAppear(_ animated: Bool) {
        todoText.text = selectedText
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detailToTodoVC"{
    let destinationVC = segue.destination as! TabBarViewController
        destinationVC.detailInfo = selectedIsChecked
        destinationVC.updateItem(item: selectedTodo)
       
    }}

    @IBAction func completeButtonClicked(_ sender: Any) {
        
       selectedIsChecked = true
        
        performSegue(withIdentifier: "detailToTodoVC", sender: nil)
        
        
    }
    
}
