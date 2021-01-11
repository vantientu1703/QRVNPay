//
//  QRVNPayService.swift
//  QRVNPay
//
//  Created by Văn Tiến Tú on 08/01/2021.
//

import UIKit
import VNPQR

enum CurrencyVNPay: String {
    case VND
    
    var value: String {
        switch self {
        case .VND:
            return "VND"
        }
    }
}

enum BankCode: String {
    case ABBANK
    case ACB
    case AGRIBANK
    case BACABANK
    case BIDV
    case DONGABANK
    case EXIMBANK
    case HDBANK
    case IVB
    case MBBANK
    case MSBANK
    case NAMABANK
    case NCB
    case OCB
    case OJB
    case PVCOMBANK
    case TECHCOMBANK
    case TPBANK
    case VPBANK
    case SEABANK
    case VIB
    case VIETABANK
    case VIETBANK
    case VIETCAPITALBANK
    case VIETCOMBANK
    case VIETINBANK
    case BIDC
    case LAOVIETBANK
    case WOORIBANK
    case AMEX
    case VISA
    case MASTERCARD
    case JCB
    case UPI
    case VNMART
    case VNPAYQR
    case PAY1
    case FOXPAY
    case VIMASS
    case VINID
    case VIVIET
    case VNPTPAY
    case YOLO
    
    var value: String {
        switch self {
        case .PAY1:
            return "1PAY"
        default:
            return self.rawValue
        }
    }
}

class QRVNPayService {
    
    static func transfer(qrString bankCode: BankCode,
                         bankName: String,
                         accountNo: String,
                         accountName: String,
                         amountString: String,
                         contentString: String) -> String? {
        return VNPQRInterface.shared()?.creatTransferQRBankCode(bankCode.value,
                                                                bankName: bankName,
                                                                accountNo: accountNo,
                                                                acountName: accountName,
                                                                amountStr: amountString,
                                                                contentStr: contentString)
    }
    
    static func scanQRCode(from controller: UIViewController, currencyType: CurrencyVNPay = .VND, languuage: LanguageType = .vietnamese, completion: ((VNPQRObjectReturn?, UINavigationController?) -> ())?) {
//        let merchantListUrl = ""
//        VNPQRInterface.setupQR("F58634", curencyType: currencyType.value, merchantListUrl: merchantListUrl, language: languuage)
        VNPQRInterface.vnpqrShowScanView(controller)
        VNPQRInterface.shared()?.vnpqrCallBack = { (infor, navi) in
            completion?(infor, navi)
        }
    }
}
