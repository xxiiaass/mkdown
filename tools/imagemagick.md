### 下载

    sudo apt-get install imagemagick
    
### 压缩图片

    convert old.jpg -resize 320x320 new.jpg
    
会按原比例压缩图片尺寸，若选择尺寸与原图尺寸比例不同，**压缩到两个尺寸都无法再压缩**

    convert old.jpg -resize 320x320 -gravity center -crop 220x220+0+0 +repage new.jpg
    
先压缩至320x320，然后居中位置开始，裁剪出一个**至多**220x220的图片
