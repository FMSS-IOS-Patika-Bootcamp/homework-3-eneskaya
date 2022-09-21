//
//  TodoViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var addTodoText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
    let newTodo = addTodoText.text!
    if segue.identifier == "toTodoView"{
    // değişken gibi işleme tabi tutmak için yapıldı.
    let destinationVC = segue.destination as! TabBarViewController // artık bu yapıya ait tüm özelliklere erişim mevcut hale geldi.
        destinationVC.todos.append(newTodo)  // ikinci ekrandaki name değişkeni ile birinci ekrandaki username değeri eşleştirildi.
        
    }}

    @IBAction func saveTodoButtonClicked(_ sender: Any) {
       
        
        //todos.append(newTodo.text!)
        
        performSegue(withIdentifier: "toTodoView", sender: nil)
        
        
    }
    
}
