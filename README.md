# salt_vagrant_debian_drupal

This is a setup using vagrant libvirt to deploy drupal with saltstack.

Setup vagrant archlinux
-----------------------

See vagrant-libvirt.txt.

Salt_Code
---------

All code is in debian folder this is based on the saltconf 15 talk of mce2.

Folder structure:
* formulas: all formulas used by debian vagrant box
* \_modules: salt module extentions
* \_states: salt states extentions
* test: Vagrantfile and from this directory run vagrant up / vagrant destory to test

