//
//  CameraVC.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 09.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class CameraVC: AVCamCameraViewController {

   
    @IBOutlet weak var previewView: AVCamPreviewView!
        
    override func viewDidLoad() {
        
        self._previewView = previewView

        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeCamera(_ sender: Any) {
        changeCamera()
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
