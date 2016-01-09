-----
记录学习到的HTML的各类元素
-----

# 1 day

* <q> 用于小部分的文本引用  

* <blockquote> 用于段落式的文本引用  

* &lt;代表'<', &gt;代表'>'  

* <hr/> 生成一条直线  

* <br/> 新行，换行  

* <abbr> 当鼠标悬停在该元素文本上时，可以显示该元素title属性的值，一般用于单词缩写，<acronym>显示相同，用于词组首字母缩写  

* <address> 地址元素，用于标记地址，一般浏览器以斜体显示  

* <ul> 生成列表，列表的每一行用<li>和<ol>包含，一个是有序，一个是无序，如果需要自定义列表标记符号，可以使用type属性，"1,A,a,I,i",可以使用这些值，start属性，可以表示开始的基数  

* <div>, <span>两个元素用于分类元素，附带属性class，div分类块级元素，span分类内联元素


### Aug 25th

* opacity属性，设置透明度

* overflow: hidden  一个铺满

* position: absolute  绝对定位

* 获取页面当前所处位置时，使用document.documentElement.scrollTop+document.body.scrollTop，才能兼容所有浏览器

<<<<<<< HEAD
----
# DATE 

August 27th Friday

## CONTENT

* object.innerHTML get text from div tag, contain html

* object.innerTEXT get text from div tag, not contain html


----

# DATE

September 1st Tuesday

## CONTENT

* jq.keypress(func(e){})   listen keypress, e.keyCode is Ascll number;
=======


<!-- -------------------------------------------------------------------------------------- -->

#　DATE

 September 14th Monday

# CONTENT

* 如果想要利用ｊｑ的鼠标滚轮事件，可以在github下载一个jq的插件，名字叫jquery-mousewheel.js，使用方法如下

` $(document).on('mousewheel', function{...} )`  or  `$('#my_elem').mousewheel(function{})`

解除事件绑定使用

` off()`  or `unbind()`

**　需要说明的是，滚轮事件发生为一个滚东，向下时event.deltaY为负，向上为正，event.deltaX为有横向滚轴时的判断值，event.deltaFactor为一个滚轮事件所滚动的距离，预计为30px（也许因浏览器和操作系统不同）**

* jq的侧边滚轴事件

`$(document).scroll( function{} )` 或 `$(document).on('scroll', function{})`

解绑用 `off('scroll')`

**官方文档中并没有给出事件的一些属性值，例如当前窗口的位置等**    

!!!!!!!!!!!!!刚刚查看文档，发现有函数可以直接获取滚动条位置

`srcollLeft(value)`可以活取或者设置滚动条的位置

或者使用以下方法

`var scrollHeight = document.documentElement.scrollTop + document.body.scrollTop` 这是获取滚轮滚动的距离，也就是说，当页面在最顶端时，这个值为0，　两个值相加时为了兼容不一样的浏览器内核

* >	var winHeight;
	if (window.innerHeight)  
		winHeight = window.innerHeight;  
	else if ((document.body) && (document.body.clientHeight))  
		winHeight = document.body.clientHeight;

这段代码可以活取当前浏览器程序的可视窗口的高度，Height替换成Width就是宽


* `parseInt($('ele').offset().top)`是jq中的方法，可以获取ele元素的绝对位置高，offset().left绝对位置横轴距离

* `position()` 则是获取相对最近的父元素的位置, .left 和 .top

* `offsetParent()`是获取最近的一个父元素

* `$('.selector').parent(".selector")`在获取父元素时，还可以进行二次选择

* 缩放动画

下载一个jq插件，jquery-transition.js,可以在ｊｓ中实现一些缩放的动画

`$(this).transition({scale: 0.9,y:100, },0)`  用法类似animate(), scale时进行大小缩放，y是进行纵向平移，x为横向平移

* 选择器

` .class span:nth-child(1)` 选择.class类下的span元素级中的第一个span元素

`.class span:nth-child(２ｎ)` 可以用来选择偶数位的子元素

<!-- ---------------------------------------------------------------------------------------- -->





# DATE

September 15th Tuesday

# CONTENT















>>>>>>> note/master



