# iOSProgramming4ed
[《iOS编程（第四版）》](https://book.douban.com/subject/26287812/)学习代码（一些零碎知识点摘录）

##第 1 章  第一个简单的 iOS 应用  

- XIB(发音“zib”)：全称 XML Interface Builder

##第 2 章  Objective-C  
- 快速枚举
  快速枚举（fast enumeration）比传统的for循环简洁很多，出错概率更低，且经过编译器的优化，通常比for循环更快。  
  限制：若需要在循环体中添加或删除对象，不能使用。

- 在Objective-C语言中，实例变量的变量名之前通常会加上一个下划线。

- 向某个类发送alloc消息，可以创建该类的对象。类在收到alloc消息后，会在内存中创建对象（在堆上创建），并返回指向新对象的指针。

- Objective-C允许向某个值为nil的变量发送消息，且不会发生任何事情。在其他语言中，向空指针（值为0的指针）发送消息是非法的。

- 在Objective-C中，数组所包含的“对象”并不是对象自身，而只是指向对象的指针。当程序将某个对象加入数组时，数组会保存该对象在内存中的地址。

- Objective-C保留了C语言的关键字，并增加了若干Objective-C特有的关键字，新增加的关键字都用@加以区分。

- 导入（#import）和C语言中的包含（#include）作用相同，差别是#import可以确保不会重复导入同一个文件。

- 如果点语法用在赋值号左边，就表示存方法；用在右边则代表取方法。

- 指定初始化方法  
  任何一个类，无论有多少个初始化方法，都必须选定其中的一个作为指定初始化（designated initializer）方法。指定初始化方法要确保对象的每一个实例变量都处在一个有效的状态。

- instancetype & id
  - instancetype: 该关键字表示方法的返回类型和调用方法的对象类型相同。init方法的返回类型都声明为instancetype。
  - id: 指向任意对象的指针（注意其本身就是指针，不能再变量名或参数钱再加“*”）。
  - instancetype 只能用来表示方法返回类型，而 id 还可以用来表示变量和方法参数的类型。若程序运行时无法确定一个对象的类型，可以声明为 id。

- self  
  self 存在于方法中，是一个隐式（implicit）局部变量。编写程序时不需要声明self，并且程序会自动为self赋值，指向收到消息的对象自身。通常情况下，self会用来向对象自己发送消息。
- super  
  向super发消息，其实是向self发消息，但是要求系统在查找方法时跳过当前对象的类，从父类开始查询。

- NSArray & NSMutableArray  
  - Objective-C 中的数组可以存储不同类型的对象。  
  - 数组对象只能保存指向 Objective-C 对象的指针，所以不能将基本类型（primitive）的变量或 C 结构加入数组对象。若要将基本类型的变量和 C 结构加入数组，可以先将它们“包装”成Objective-C 对象，例如 NSNumber、NSValue 和 NSData。  
  - 注意：不能将 nil 加入数组对象。若要将“空洞”加入数组对象，必须使用 NSNull 对象。

- 运行时错误&编译时错误
  - 运行时错误：即异常（exception）
  - 编译时错误：只会在构建应用或编译代码时出现。

- Objective-C 没有提供名字空间（namespace）机制。

- @import 和 #import  
  Apple 发现在项目中维护 .pch 文件低效耗时，因此继续优化并引入了 @import 指令，eg:   `@import Foundation;`   
  这行代码会告诉编译器需要使用 `Foundation` 框架，之后优化预编译头文件和缓存编译结果的过程。同时，文件中不要再明确引用框架——编译器会根据 `@import` 自动导入相应的框架（目前只有Apple提供的框架可以使用`@import`）。

头文件中的声明顺序：实例变量在最前面，然后是类方法，接下来是初始化方法，最后是其他方法。这样更易读。

##第 3 章  通过 ARC 管理内存  

- 哪些情况会使对象失去拥有者？
  1. 当程序修改某个指向特定对象的变量并将其指向另一个对象时；
  2. 当程序将某个指向特定对象的变量设置为nil时；
  3. 当程序释放对象的某个拥有者时；
  4. 当从collection类（例如数组）删除对象时。

注意：当某个对象失去一个拥有者时，程序不一定会释放这个对象。只要还有另一个指向该对象的指针，程序就会保留这个对象。但当某个对象失去最后一个拥有者时，就一定会被释放。

- 强引用 & 弱引用
  - 强引用（strong reference）：对象多一个拥有者，且不会被程序释放。
  - 弱引用（weak reference）：此特质表明该属性定义了一种“非拥有关系” (nonowning relationship)（不会改变对象拥有者个数）。为这种属性设置新值时，设置方法既不保留新值，也不释放旧值。在属性所指的对象遭到摧毁时，属性值也会清空(nil out)。
- 属性

若声明了一个名为 itemName 的属性，编译器会自动生成实例变量 `_itemName`、取方法 `itemName` 和存方法 `setItamName`

- 属性的特性
  - 多线程特性：2种， `nonatomic` 和 `atomic` (默认)。
  - 读/写特性：2种， `readwrite` （默认）和 `readonly` 。
  - 内存管理特性：4种， `strong` (对象属性的默认值), `weak`, `copy` 和 `unsafe_unretained` （非对象属性的默认值）。
    - 不指向任何对象的属性，不需要做内存管理（例如 `int` 类型的属性），这时应该选 `unsafe_unretained` ，它表示存取方法会直接为实例变量赋值。Apple 引入 ARC 之前曾经使用 `assign` 表示这种类型。
    - 通常情况下，当某个属性是指向其他对象的指针，而且该对象的类有可修改的子类（例如 `NSString/NSMutableString` 或 `NSArray/NSMutableArray`）时，应该将该属性的内存管理特性设置为 `copy`.
    - 只有可变对象应该设置为 `copy` ，而复制不可变对象会浪费内存空间。为避免不必要的复制，向不可变对象发送 `copy` 消息时，会返回一个指向自己（仍然是不可变的）的指针。
    - 使用 `copy` 的原因：如果属性指向的对象的类有可修改的子类，那么该属性可能会指向可修改的子类对象；同时，该对象可能会被其他拥有者修改。因此，最好先复制该对象，然后再将属性指向复制后的对象。
- 自定义属性的存取方法

注意：如果既覆盖了存方法，也覆盖了取方法（或者为只读属性覆盖了取方法），那么编译器不会再自动创建相应的实例变量了。如果需要实例变量，就必须明确声明。

- 属性合成

在头文件中声明属性时，只会生成存取方法的声明。为了让属性生成实例变量并实现存取方法，该属性必须被合成（synthesized）。例如：

```swift
@implement Person
//创建存取方法，方法名是 age 和 setAge, 同时创建实例变量 _age
@synthesize age = _age;

@end
```

也可以不写变量名，这样实例变量的变量名会和方法名相同：

```swift
@synthesize age;

//和以下语句效果相同
@synthesize age = age;
```







##第 4 章  视图与视图层次结构  
##第 5 章  视图：重绘与 UIScrollView  
##第 6 章  视图控制器  
##第 7 章  委托与文本输入  
##第 8 章  UITableView 与 UITableViewController  
##第 9 章  编辑 UITableView  
##第 10 章  UINavigationController  
##第 11 章  相机  
##第 12 章  触摸事件和 UIResponder  
##第 13 章  UIGestureRecognizer 与 UIMenuController  


>原书代码地址：[https://github.com/dingdaojun/iOSProgramming4ed](https://github.com/dingdaojun/iOSProgramming4ed)
