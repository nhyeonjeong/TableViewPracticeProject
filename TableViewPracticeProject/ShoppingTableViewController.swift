//
//  ShoppingTableViewController.swift
//  TableViewPracticeProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var appendButton: UIButton!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var inHeaderView: UIView!
    
    var todoList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    var checkListIdx = [0]
    var favoritesIdx = [0, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        inHeaderView.layer.cornerRadius = 10
        designAppendButton(appendButton)
        designTextField(inputTextField)

    }

    @IBAction func appendButtonClicked(_ sender: UIButton) {
        todoList.append(inputTextField.text!)
        inputTextField.text = ""
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        // 체크박스 확인
        let checkboxImage = UIImage(systemName: checkListIdx.contains(indexPath.row) ? "checkmark.square.fill" : "checkmark.square")
        cell.checkboxButton.tintColor = .black
        cell.checkboxButton.setImage(checkboxImage, for: .normal)
//        
        // 즐겨찾기 확인
        let favoritesButtonImage = UIImage(systemName: favoritesIdx.contains(indexPath.row) ? "star.fill" : "star")
        cell.favoritesButton.tintColor = .black
        cell.favoritesButton.setImage(favoritesButtonImage, for: .normal)
        
        cell.titleLabel.text = todoList[indexPath.row]
        cell.titleLabel.font = .systemFont(ofSize: 15)
        
        cell.cellView.backgroundColor = .systemGray6
        cell.cellView.layer.cornerRadius = 10
        
//        cell.layer.borderColor = UIColor.white.cgColor
//        cell.layer.borderWidth = 2
               
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func designAppendButton(_ button: UIButton) {
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
    }
    
    func designTextField(_ textfield: UITextField) {
        textfield.placeholder = "무엇을 구매하실 건가요?"
        // textfield의 테두리를 없애고 싶다면 아래 두 줄을 모두 작성애햐 한다.
        // 어느 하나라도 없으면 테두리 나옴
        textfield.layer.borderColor = UIColor.systemGray6.cgColor
        textfield.layer.borderWidth = 1
        
        
    }

}
