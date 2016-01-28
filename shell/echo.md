## echo

 

颜色表 

  前景              背 景               颜色
   ---------------------------------------
   30                40                黑色
   31                41                紅 色
   32                42                綠色
   33                43                黃色
   34                44                藍色
   35                45                紫紅色
   36                46                青藍色
   37                47                白色

  代码               意义
   -------------------------
   0                 OFF
   1                  高亮显示
   4                 underline
   5                  闪烁
   7                  反 白显示
   8                  不可见



echo -e "\e[1;30m skyapp exist \e[0m" //黑色
echo -e "\e[1;31m skyapp exist \e[0m" //红色
echo -e "\e[1;32m skyapp exist \e[0m" //绿色
echo -e "\e[1;33m skyapp exist \e[0m" //黄色
echo -e "\e[1;34m skyapp exist \e[0m" //蓝色
echo -e "\e[1;35m skyapp exist \e[0m" //紫色
echo -e "\e[1;36m skyapp exist \e[0m" //青绿
echo -e "\e[1;37m skyapp exist \e[0m" //白（灰）