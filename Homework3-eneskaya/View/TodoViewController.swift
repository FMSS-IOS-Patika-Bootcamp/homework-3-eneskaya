//
//  TodoViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//


import UIKit

// Todo view controller
class TodoViewController: UIViewController {

    @IBOutlet weak var addTodoText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
   
    if segue.identifier == "toTodoView"{
    
    let destinationVC = segue.destination as! TabBarViewController /
        let newTodo = addTodoText.text!
        destinationVC.createAnItem(name: newTodo)
        
    }}

    @IBAction func saveTodoButtonClicked(_ sender: Any) {
       
        
       
        
        performSegue(withIdentifier: "toTodoView", sender: nil)
        
        
    }
    
}
