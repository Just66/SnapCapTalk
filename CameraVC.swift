//
//  CameraVC.swift
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 09.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AVCamCameraViewController, AVCamCameraVCDelegate {

   
    @IBOutlet weak var camBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var previewView: AVCamPreviewView!
    @IBOutlet weak var modeBtn: UISegmentedControl!
        
    override func viewDidLoad() {
        
        delegate = self
        _captureModeControl = modeBtn
        _previewView = previewView

        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard FIRAuth.auth()?.currentUser != nil else {
                performSegue(withIdentifier: "LoginVC", sender: nil)
                return
            }
    }

    
    @IBAction func toggleControll(_ sender: Any) {
        toggleCaptureMode()
            }
    
    @IBAction func changeCamera(_ sender: Any) {
        changeCamera()
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
        
    }
    
    func shouldEnableControls(_ enable: Bool) {
        camBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecord(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should enable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("record has started")
    }
    
    func recordingCanStart() {
        print("record can start")
    }
    
    func videoRecordingFailed() {
        
    }
    
    func videoRecordingComplete(_ videoUrl: URL!) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL" : videoUrl])
    }
    
    func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: "UserVC", sender: ["snapshotData" : snapshotData])
    }
    
    func snapshotVailed() {
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userVC = segue.destination as? UserVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
                userVC.videoURL = url
            } else if let snapDict = sender as? Dictionary<String, Data> {
                let snapData = snapDict["snapshotData"]
                userVC.snapData = snapData
            }
        }
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
