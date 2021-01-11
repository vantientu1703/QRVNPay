//
//  ViewController.swift
//  QRVNPay
//
//  Created by Văn Tiến Tú on 08/01/2021.
//

import UIKit
import VNPQR

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func qrCodeAction(_ sender: Any) {
        
        QRVNPayService.scanQRCode(from: self) { (object, navi) in
            print("items = \(object?.items)\n payAmount = \(object?.payAmount)\n payCCY = \(object?.payCCY)\n payMerchantCode = \(object?.merchantCode)\n masterMerchantCode =  \(object?.masterMerchantCode)\n qrType = \(object?.qrType)\n qrTranAmount =  \(object?.qrTranAmount) \n arTranContent = \(object?.qrTranContent)\n qrTranBankCode =  \(object?.qrTranBankCode)\n qrTranBankName = \(object?.qrTranBankName)\n qrTranAccountNo =  \(object?.qrTranAccountNo)\n qrTranAccountName = \(object?.qrTranAccountName)")
            
        }
        
        
//        if let qrString = VNPQRInterface.shared()?.creatTransferQRBankCode("NCB", bankName:"NCB", accountNo:"9704198526191432198", acountName:"NGUYEN VAN A", amountStr:"200000", contentStr:"Chuyen Khoan Tra No") {
//            DispatchQueue.main.async {
//                VNPQRInterface.vnpqrCall(fromWeb: qrString, inView: self)
//            }
//        }
    }
}

