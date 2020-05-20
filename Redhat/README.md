# Redhat README




# Docker on RedHat
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index#getting_docker_in_rhel_7



# Checking disk

```bash
df
lsbkl -l


```


# Resizing Logical Volume Manager (LVM)
- Be careful shrinking. Easy to extend, difficult/dangerous to shrink.
- Extending is safe

## Create a new partition
- Login to superuser
- Use gparted to create and new partition

```
sudo yum install --enablerepo=centos gparted
```

- Let's say the new partion is /dev/sda5

## Configure LVM
LVM itself consists of three logical “layers”:

Physical devices (pv)
Volume groups (vg)
Logical volumes (lv)


pvcreate /dev/sda5
pvdisplay

vgextend nameOfGroup /dev/sda5

nameOfGroup = "vg00"

lvdisplay

```bash
#To extend a logical volume you simply tell the lvextend command how much you want to increase the size. You can specify how much to grow the volume, or how large you want it to grow to:

# lvextend -L12G /dev/myvg/homevol
lvextend -- extending logical volume "/dev/myvg/homevol" to 12 GB
lvextend -- doing automatic backup of volume group "myvg"
lvextend -- logical volume "/dev/myvg/homevol" successfully extended
        
#will extend /dev/myvg/homevol to 12 Gigabytes.


# lvextend -L+1G /dev/myvg/homevol
lvextend -- extending logical volume "/dev/myvg/homevol" to 13 GB
lvextend -- doing automatic backup of volume group "myvg"
lvextend -- logical volume "/dev/myvg/homevol" successfully extended
        
will add another gigabyte to /dev/myvg/homevol.
```

#Grow volume on CentOS 7

xfs_growfs /dev/mapper/vg00-var



## References
- https://www.binarytides.com/linux-command-check-disk-partitions/ 
- https://www.krenger.ch/blog/linux-lvm-how-to-adding-a-new-partition/
- https://www.tldp.org/HOWTO/LVM-HOWTO/extendlv.html
- https://www.thegeekdiary.com/centos-rhel-how-to-extend-physical-volume-in-lvm-by-extending-the-disk-partition-used/
- https://www.tecmint.com/extend-and-reduce-lvms-in-linux/



# References
- https://www.cyberciti.biz/faq/centos-fedora-redhat-yum-repolist-command-tolist-package-repositories
- https://unix.stackexchange.com/questions/433046/how-do-i-enable-centos-repositories-on-rhel-red-hat




