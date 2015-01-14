KERNEL_VERSION="$(uname -r | sed 's/^\(.\+\)-[^0-9]\+$/\1/')"
old_kernels() {
  # list all linux packages
  dpkg -l 'linux-*' | \
      # filter to those lines that are installed (start with 'ii')
      grep -e '^ii' | \
      # strip to just package names
      cut -d' ' -f3 | \
      # filter down to version-specific linux kernel packages
      grep -e '^linux-\(headers\|image\|image-extra\)-[0-9]' | \
      # filter out the current kernel version
      grep -ve "$KERNEL_VERSION"
}
old_kernels | xargs aptitude purge -y
update-grub2
service ssh stop && reboot
