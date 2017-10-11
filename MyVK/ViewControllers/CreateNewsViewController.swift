//
//  CreateNewsViewController.swift
//  MyVK
//
//  Created by itisioslab on 11.10.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit

class CreateNewsViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var createNewsButton: UIBarButtonItem!
    var dataTransferDelagete: DataTransferProtocol?
    @IBOutlet weak var newsTextView: UITextView!
    let defoultTextInTextView = "Что нового?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTextView.delegate = self
        newsTextView.textColor = UIColor.lightGray
        createNewsButton.isEnabled = false
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createNewsButtonPressed(_ sender: Any) {
        
        guard let note = newsTextView.text else { return }
        dataTransferDelagete?.didPressDone(with: note)
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if newsTextView.textColor == UIColor.lightGray {
            newsTextView.text = ""
            newsTextView.textColor = UIColor.black
            createNewsButton.isEnabled = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if newsTextView.text == "" {
            newsTextView.text = defoultTextInTextView
            newsTextView.textColor = UIColor.lightGray
        }
    }
}
