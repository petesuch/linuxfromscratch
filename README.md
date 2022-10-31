Linux from Scratch automated compile and install scripts taken from Chapter 8 from the Release Systemd version of 11.2.

There are 2 parts: part1.sh and part2.sh  
If you endevor to run these shell scripts place them both in your /mnt/lfs/sources directory
Do the necessary binding of kernel process and do the chroot into the LFS environment 
/mnt/lfs/sources would then become your /sources directory.

THe inspiration comes from the Jhalfs project which I am not smart enough to understand -yet, but have enormous respect for Beekman and Dubbs and the rest of the devs on this project which in my mind is the real future of Linux.

The author takes no responsibility for any damages it may do to your machine.
It is "take it or leave it" software.  I recommend experimenting within a virtual machine
or virtualbox. Both parts take nearly a full day to compile test and install.
I ommited the Bash and Vim testing mainly because they seems to work well and I did not want to switch shells mid way through the shell script -- you can change that if you wish.    

I also did not remove the tester user as the final part of chapter 8 has you do. 
So that is left to you, the user of this software.  

Good luck with it.  There are improvements that could be made: Like a check for errors. The BASE_DIR sed scripts are clumsy. Also I wish I could populate the instructions more simply.

I have tested these scripts now roughly 5 times and the output files look good.  If you so desire pipe the scripts through 2>&1 | tee /whereever/youwant/youroutput

OR You may just also simply run: 
(chroot lfs) root:/sources# sh part1.sh

