# Ecmascript6学习记录

最近在进一步学习js，自然需要在新的规范上下功夫了。

这本书[《ECMAScript 6入门》](http://es6.ruanyifeng.com/)将得还是很详细的，很细的那种

细节太多了，有的东西实用，有的却不是那么急，我大概通读一遍后，摘录一些自己觉得很实用的记录下来


## 解构赋值(node-v5.2.0竟然不支持)

这个东西个人感觉就是打包，本来几条语句做到的事情，他一句昨晚，方便一些。

    var [a, b, c] = [1, 2, 3];

如果要能实现这个语法，左右两边的类型必须具备Iterator遍历操作对象，这个就有点像C++中的STL。
ECMA6js具备这个功能的，数组、对象、set、map，string。

能有默认值

    [x, y = 'b'] = ['a'] // x='a', y='b'；

对象赋值

    var { foo, bar } = { foo: "aaa", bar: "bbb" };

## 数组

#### Array.from()

这个功能是将具有Iterator借口的数据，转为数组，**或者具有leng属性的对象**，并且对字符集的处理很好。

    Array.from('adv但是');//['a', 'b', 'v'， '但','是'];
    let arrayLike = {
        '0': 'a',
        '1': 'b',
        '2': 'c',
        length: 3 //必须带这个属性，否则不成功
    };
    let newarray = Array.from(let);

第二个参数为一个处理放进数组中每个元素的函数，等同于数组的map方法

    Array.from([1, 2, 3], (x) => x * x)// [1, 4, 9] 

于是，就可以这样做。比如我想得到一个5个数字的等比数列。

    let i=0, j=2;
    Array.from({ length: 5 }, () => {i++;return Math.pow(j,i);});
    //[ 2, 4, 8, 16, 32 ]

还可以用于将两个数组合并

    let array1 = ['a', 'b'];
    let array2 = ['c', 'd'];
    let arr = Array.from([...array1, ...array2]);

   

#### Array.of()

对原来数组构造函数的一个补充，根据参数，返回一个跟参数相同数量的数组

    Array.of() // []
    Array.of(undefined) // [undefined]
    Array.of(1) // [1]
    Array.of(1, 2) // [1, 2]

#### 数组实例的find()和findIndex()

需找数组中是否含有自己定义条件的元素，一个返回值，一个返回序列，都能正确识别NaN,用来代替原来的indexOf()。

参数都为回调函数function(value， index， arr)，当回调函数返回true时，结束遍历，没有找到，则返回undefined

    [1, 5, 10, 15].find(function(value, index, arr) {
      return value > 9;
    }) // 10

#### 数组实例的fill()

填充函数， 第一个参数是填充内容，2、3参数可选，分别为填充的起始、结束位置

    ['a', 'b', 'c'].fill(7, 1, 2)
    // ['a', 7, 'c']


#### 数组实例的entries()，keys()和values() 

//(node-v5.2.0不支持)
ES6提供三个新的方法——entries()，keys()和values()——用于遍历数组。它们都返回一个遍历器对象，可以用for...of循环进行遍历，唯一的区别是keys()是对键名的遍历、values()是对键值的遍历，entries()是对键值对的遍历。

    for (let index of ['a', 'b'].keys()) {
      console.log(index);
    }
    // 0
    // 1

    for (let elem of ['a', 'b'].values()) {
      console.log(elem);
    }
    // 'a'
    // 'b'

    for (let [index, elem] of ['a', 'b'].entries()) {
      console.log(index, elem);
    }
    // 0 "a"
    // 1 "b"

#### 数组实例方法join()

将数组中的元素组成字符串，一参数中提供的分隔符分开

  ['sd',2,3,4].join(',') //'sd,2,3,4'

## 函数

最大的改变就是箭头函数,箭头函数默认不具备this。

还有一个就是扩展运算符’...‘;

+ 在函数参数中，用作不定参数的写法。
    ```
    function add(...values) {
      let sum = 0;
      for (var val of values) {
        sum += val;
      }
      return sum;
    }
    add(2, 5, 3) // 10
    ```
+ 可以作为传参使用

    ```
    function f(x, y, z) {
        console.log(x, y, z);
    }
    var args = [0, 1, 2];
    f(...args)
    ```

+ 将一个数组加到另一个数组中    
    ```
    var arr1 = [0, 1, 2];
    var arr2 = [3, 4, 5];
    arr1.push(...arr2);
    ```

+ 合并数组
    ```
    // ES5
    [1, 2].concat(more)
    // ES6
    [1, 2, ...more]

    var arr1 = ['a', 'b'];
    var arr2 = ['c'];
    var arr3 = ['d', 'e'];

    // ES5的合并数组
    arr1.concat(arr2, arr3));
    // [ 'a', 'b', 'c', 'd', 'e' ]

    // ES6的合并数组
    [...arr1, ...arr2, ...arr3]
    // [ 'a', 'b', 'c', 'd', 'e' ]
    ```

+ 还可以代替Array.from()方法，从字符串，set，map，结构中转化为数组
    ```
    let arr = [...'十大高手']
    console.log(arr);
    //[ '十', '大', '高', '手' ]
    ```


## 对象

+ 合并对象的方法

  Object.assign(list, obj1, obj2 ...);

返回的是将obj1， obj2插入list后的对对象返回



















