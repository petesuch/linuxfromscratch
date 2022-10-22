#  Linux from Scratch automated compile and install scripts taken from Chapter 8 from the Release Systemd 
#  version of 11.2.
#  There are 2 parts. part1 and part2.  
#   
#  If you endevor to run this place both shell scripts in your /mnt/lfs/sources directory
#  Do the necessary binding of kernel process and do the chroot into the LFS environment 
#  /mnt/lfs/source will now become your /sources directory.

#  THe inspiration comes from the Jhalfs project which I am not smart enough to understand, but have enormous respect
#  for Beekman Dubbs and the rest of the devs on this project which in my mind is the real future of Linux.

#  The author takes no responsibility for any damages it may do to your machine.
#  It is "take it or leave it" software.  I recommend experimenting within a virtual machine
#  or virtualbox. Both parts take nearly a full day to compile test and install.
#  I ommited the Bash testing mainly because it seems to work well I did not want to switch shells
#  mid way through the part 2 shell script.  

#   I also did not remove the tester user as the final part of chapter 8 has you do. 
#   So that is left to the user of this software.  

#  Good luck with it.  THere are improvements that could be made:
#    Like a check for errors.
#    The BASE_DIR sed script is clumsy.  
#    Also I wish I could populate the instructions more simply. ;)
