//
//  SettingTableViewController.swift
//  TableViewPracticeProject
//
//  Created by 남현정 on 2024/01/08.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let titleList = [["공지사항", "실험실", "버전 정보"],
                     ["개인/보안", "알림", "채팅", "멀티프로필"],
                     ["고객센터/도움말"]]
                    
    
    let headerList = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = titleList[indexPath.section][indexPath.row]
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return headerList[section]
    }

}
