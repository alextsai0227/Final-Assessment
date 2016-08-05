# Final-Assessment
Q1. 用for-loop從1~100中取出單數，並把他們加起來。
Q2. 首先兩個view的長寬相等，螢幕寬度改變時，view的距離不變，但view的寬變長，因此首先讓兩個view的width相等，
    固定2個view的高以及bottom constrain，在固定左邊view的leading space constrain和右邊view的traillingspace constrain
    以及兩個view中間的horizontal space即完成。
Q3.用Alamofire Get request 把資料抓回來，用swiftyJSON接資料，再把資料取出用NSLog印出。3.2 Post request 時發出NSDate()當parameter
    在撈回資料時用timeIntervalSinceDate算出花了幾秒。
  參考http://stackoverflow.com/questions/2129794/how-to-log-a-methods-execution-time-exactly-in-milliseconds#comment22972089_2129884

Q4.製作6個item的collectionview，在didselect function中去實作每個item被點擊後觸發的事件。
  參考 Open Setting http://stackoverflow.com/questions/28152526/how-do-i-open-phone-settings-when-a-button-is-clicked-ios
  參考 Open Map     http://stackoverflow.com/questions/21746373/open-maps-with-specific-address-ios-7
  
Q5. 首先做了tableview，按新增後push到下一個viewController, 在viewdidload時present UIImagePickerController，結束後收掉UIImagePickerController
    把image傳給viewController 顯示在畫面中，並用Singleton把image和textfield接起來，傳回tableView。
5.2 在imageview底層放scrollview，實作viewForZoomingInScrollView finction，接下來在tableviewdelegate那邊實作UITableViewCellEditingStyle function
    並且將Singleton裡的image資料清掉。
5.3 用userDefault把image 資料儲存下來，但是因為userDefault不能存UIimage因次要在儲存時把encode成NSdata，取出時再decode NSData成
    UIImage。
    參考http://swiftcafe.io/2015/11/13/cafe-time-nscoding/
