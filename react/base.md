# react入门注意点

### 自定义组件

+ 开头必须大写字母

例如
  
  var MyDemoDom = React.createClass({
        render: function() {
          return <h1>hello</h1>;
        }
      });

+ 自定义组件必须含有render方法

+ render中返回的html标签的class