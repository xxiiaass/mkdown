# 打开img文件

之前利用fdisk，然后mount，打开img文件，经常失败。

今天发现一个新的方法
    
    sudo losetup /dev/loop0 test.img
    sudo kpartx -av /dev/loop0
    sudo mount /dev/mapper/loop0p1 /mnt