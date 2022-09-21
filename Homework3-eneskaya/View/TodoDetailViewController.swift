//
//  TodoDetailViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//

import UIKit

class TodoDetailViewController: UIViewController {

    
    @IBOutlet weak var todoText: UILabel!
    var selectedIsChecked : Bool = false
    var selectedText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        todoText.text = selectedText
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
    if segue.identifier == "detailToTodoVC"{
    let destinationVC = segue.destination as! TabBarViewController // artık bu yapıya ait tüm
        destinationVC.detailInfo = selectedIsChecked
       
    }}

    @IBAction func completeButtonClicked(_ sender: Any) {
        
       selectedIsChecked = true
        
        performSegue(withIdentifier: "detailToTodoVC", sender: nil)
        
        
    }
    
}
