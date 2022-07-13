//
//  ViewController.swift
//  Observer
//
//  Created by Ammad on 13/07/2022.
//

import UIKit
import Combine
import SwiftUI
import RxSwift
import RxCocoa
import RxRelay
class ViewController: UIViewController {
    
@ObservedObject private var user=User()
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var label1: UILabel!
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textFieldPublisher = NotificationCenter.default
                  .publisher(for: UITextField.textDidChangeNotification, object: textfield1)
                  .map( {
                      ($0.object as? UITextField)?.text
                  })
              
              textFieldPublisher
                  .receive(on: RunLoop.main)
                  .sink(receiveValue: { [weak self] value in
                      print("UITextField.text changed to: \(value)")
                  })
                  .store(in: &cancellables)
  //      label1.text=user.name
       // textfield1.text=user.name
        
        /*
       textfield1.rx.didChange.subscribe {
            self.label1.text=self.textfield1.text
            print("some action")
        }*/
        // Do any additional setup after loading the view.
       
    }


}

