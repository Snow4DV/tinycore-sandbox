#/bin/bash
rm -r data/rootfs/code/c data/rootfs/code/c++
cp -r c/ data/rootfs/code/c
cp -r c++/ data/rootfs/code/c++
cd data
rm rootiso/boot/core.gz
cd rootfs
if [ "$1" != "--dont-repack-fs" ]; then
	find . | sudo cpio -o -H newc | gzip -2 > ../rootiso/boot/core.gz
fi
echo "----LINUX FS:-----"
ls
echo "------------------"
cd ..
mkisofs -l -J -V TC-custom -no-emul-boot -boot-load-size 4 -boot-info-table -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat -o result.iso rootiso
qemu-system-x86_64 -cdrom result.iso -boot order=d -m 1024m -nographic
