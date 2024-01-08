//
//  ShoppingTableViewController.swift
//  TableViewPracticeProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit

// struct는 초기화 안해주고 init생성 안해도 인스턴스 생성할 때 넣어주면 됨.
struct ShoppingCheck {
    var isChecked: Bool
    var todoText: String
    var isFavorite: Bool
}

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var appendButton: UIButton!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var inHeaderView: UIView!
    
    // 구조체 인스턴스 생성
    var shoppingCheckList = [ShoppingCheck(isChecked: true, todoText: "그립톡 구매하기", isFavorite: true),
                             ShoppingCheck(isChecked: false, todoText: "사이다 구매", isFavorite: false),
                             ShoppingCheck(isChecked: false, todoText: "아이패드 케이스 최저가 알아보기", isFavorite: true),
                             ShoppingCheck(isChecked: false, todoText: "양말", isFavorite: true)]
//    var checkListIdx = [0]
//    var favoritesIdx = [0, 2,
//    var todoList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        tableView.rowHeight = 50 // 행의 높이가 모두 같으므로 프로퍼티로
        
        inHeaderView.layer.cornerRadius = 10
        designAppendButton(appendButton)
        designTextField(inputTextField)

    }

    // 추가 버튼 눌렀을 때
    @IBAction func appendButtonClicked(_ sender: UIButton) {
        shoppingCheckList.append(ShoppingCheck(isChecked: false, todoText: inputTextField.text!, isFavorite: false))
        inputTextField.text = ""
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCheckList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.checkboxButton.tag = indexPath.row
        cell.favoritesButton.tag = indexPath.row
        // 체크박스 확인
        let checkboxImage = UIImage(systemName: shoppingCheckList[indexPath.row].isChecked ? "checkmark.square.fill" : "checkmark.square")
        cell.checkboxButton.tintColor = .black
        cell.checkboxButton.setImage(checkboxImage, for: .normal)
//        
        // 즐겨찾기 확인
        let favoritesButtonImage = UIImage(systemName: shoppingCheckList[indexPath.row].isFavorite ? "star.fill" : "star")
        cell.favoritesButton.tintColor = .black
        cell.favoritesButton.setImage(favoritesButtonImage, for: .normal)
        
        cell.titleLabel.text = shoppingCheckList[indexPath.row].todoText
        cell.titleLabel.font = .systemFont(ofSize: 15)
        
        cell.cellView.backgroundColor = .systemGray6
        cell.cellView.layer.cornerRadius = 10
        
        // 테이블뷰사이 간격을 띄우는 건 불가능 -> uiview로 띄운 것처럼 보이게 하는 것이다.
//        cell.layer.borderColor = UIColor.white.cgColor
//        cell.layer.borderWidth = 2
        
        // 체크박스를 눌렀을 때
        cell.checkboxButton.addTarget(self, action: #selector(checkboxButtonclicked), for: .touchUpInside)
        
        // 즐겨찾기 눌렀을 때
        cell.favoritesButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
               
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    @objc func checkboxButtonclicked(_ sender: UIButton) {
        shoppingCheckList[sender.tag].isChecked.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func favoriteButtonClicked(_ sender: UIButton) {
        shoppingCheckList[sender.tag].isFavorite.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
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
