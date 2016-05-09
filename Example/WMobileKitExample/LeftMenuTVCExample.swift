//
//  LeftMenuVCExample.swift
//  WMobileKitExample

import UIKit
import WMobileKit

class NavigationVC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class LeftMenuTVCExample: UITableViewController {
    lazy var pagingControlExamplesVC:NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("pagingControlExamplesVC") as! NavigationVC // PagingControlExamplesVC
    lazy var pagingSelectorVC:NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("pagingSelectorVC") as! NavigationVC // WPagingSelectorVC
    lazy var userLogoViewExamplesVC:NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("userLogoViewExamplesVC") as! NavigationVC // UserLogoViewExamplesVC
    lazy var modalViewExamplesVC:NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("modalViewExamplesVC") as! NavigationVC // ModalViewExamplesVC
    lazy var textFieldExamplesVC: NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("textFieldExamplesVC") as! NavigationVC // TextFieldExamplesVC
    lazy var autoCompleteTextFieldExampleVC: NavigationVC = mainStoryboard.instantiateViewControllerWithIdentifier("autoCompleteTextFieldExampleVC") as! NavigationVC // AutoCompleteTextFieldExampleVC

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            sideMenuController()?.changeMainViewController(pagingControlExamplesVC)
            break
        case 1:
            // Create simple VC's to send to pagingSelectorVC
            let vc1 = WSideMenuContentVC()
            vc1.view.backgroundColor = UIColor.greenColor()

            let vc2 = WSideMenuContentVC()
            vc2.view.backgroundColor = UIColor.blueColor()

            let vc3 = WSideMenuContentVC()
            vc3.view.backgroundColor = UIColor.redColor()

            let vc4 = mainStoryboard.instantiateViewControllerWithIdentifier("textVC") as! WSideMenuContentVC

            if let pagingVC = pagingSelectorVC.viewControllers[0] as? WPagingSelectorVC {
                pagingVC.tabWidth = 90
                pagingVC.pagingControlHeight = 44
                pagingVC.tabTextColor = WThemeManager.sharedInstance.currentTheme.secondaryTextColor

                let pages = [
                    WPage(title: "Green VC", viewController: vc1),
                    WPage(title: "Blue VC", viewController: vc2),
                    WPage(title: "Red VC", viewController: vc3),
                    WPage(title: "Text VC", viewController: vc4)
                ]

                pagingVC.pages = pages
            }

            sideMenuController()?.changeMainViewController(pagingSelectorVC)
            break
        case 2:
            sideMenuController()?.changeMainViewController(userLogoViewExamplesVC)
            break
        case 3:
            sideMenuController()?.changeMainViewController(modalViewExamplesVC)
            break
        case 4:
            sideMenuController()?.changeMainViewController(textFieldExamplesVC)
            break
        case 5:
            sideMenuController()?.changeMainViewController(autoCompleteTextFieldExampleVC)
            break
        default:
            break
        }

        sideMenuController()?.closeSideMenu()

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }

    func defaultVC() -> UIViewController {
        return pagingControlExamplesVC
    }
}
