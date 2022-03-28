//
//  CustomTextView.swift
//  TheWay
//
//  Created by 林小鹏 on 2022/1/13.
//  添加 textView  占位符
//  

class CustomTextView: UITextView {
    private var _placeholder: String!

    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame, textContainer: nil)
        _placeholder = placeholder
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: self) // 观察是否有文字输入
    }

    func newPlaceholder(_ d: String) {
        _placeholder = d
        textDidChange()
    }

    // 无论我们想要绘制什么图形，首要任务就是先获取上下文，你可以把上下文理解成一块画布，有了画布才能画东西；iOS 有三种获取上下文的方式：重写 UIView 的drawRect 和 drawRect inContext 方法会自动生成一个上下文，我们直接在这两个方法里绘制内容，UIView 就能自动渲染出来了，还有一种方法是使用UIGraphicsBeginImageContextWithOptions方法自己创建一个 UIImage 类型的上下文，然后使用let ctx = UIGraphicsGetCurrentContext() 获取就行了
    override func draw(_ rect: CGRect) {
        if hasText {
            return // 如果输入框内有文字，直接返回
        }
        _placeholder.draw(in: CGRect(x: 5, y: 7, width: rect.width - 10, height: rect.height), withAttributes: [NSAttributedString.Key.foregroundColor: rColor.textColorGrayA9A7B4, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]) // 占位符的位置坐标，字体大小以及绘制区域大小，如果你对占位符的大小和位置不满意，请在这修改
    }

    @objc func textDidChange() {
        setNeedsDisplay() // 调用drawRect方法，切勿手动调用drawRect方法
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/////////////////////////
//
// func viewDidLoad() {
//        super.viewDidLoad()
//        let textView = CustomTextView(frame: CGRect(x: 100, y: 100, width: 100, height: 100),placeholder:"我是占位符")
//        textView.backgroundColor = UIColor.brown
//        view.addSubview(textView)
//    }
// }
