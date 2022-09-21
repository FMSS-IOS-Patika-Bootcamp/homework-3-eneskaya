//
//  TabBarViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit

class TabBarViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    
    var choosenTodo = ""
    var choosenisChecked : Bool = false
    var detailInfo = false
    var todos: [String] = ["Don't Forget Eat","Every Night Sleep", "Take a Shower", "Go to Home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
       
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell",for: indexPath) as! TodoCell
        
        cell.todoLabel.text = todos[indexPath.row]
        cell.checkmarkImage.image = UIImage(named: "checkmark.png")
  
        
        return cell
    }
  
      
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        
        self.choosenTodo = todos[indexPath.row]
        
        choosenisChecked = cell.isChecked
        
        
        
      
            if cell.isChecked == false {
               
                 cell.checkmarkImage.image = UIImage(named: "checkmarkfill.png")
                cell.isChecked = true
             }
             else{
                
                 cell.checkmarkImage.image = UIImage(named: "checkmark.png")
                 cell.isChecked = false
             }
        
      
        
       
        performSegue(withIdentifier: "toTodoDetailVC", sender: nil)
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
        if segue.identifier == "toTodoDetailVC"{
        let destinationVC = segue.destination as! TodoDetailViewController // artık bu yapıya ait tüm
            destinationVC.selectedText = choosenTodo
            destinationVC.selectedIsChecked = choosenisChecked
        
            
    
            
            
        }}
   
        
        
    
    
  
       
    
    

}
