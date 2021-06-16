{

  vim = "nvim";

  cp = "cp -i";
  mv = "mv -i";
  rm = "rm -i";
  ctl = "systemctl";

  addup = "git add -u";
  addall = "git add .";
  branch = "git branch";
  checkout = "git checkout";
  clone = "git clone";
  commit = "git commit -m";
  fetch = "git fetch";
  pull = "git pull origin";
  push = "git push origin";
  tag = "git tag";
  newtag = "git tag -a";

  nordc = "systemctl start openvpn-nordVPN.service";
  nordd = "systemctl stop openvpn-nordVPN.service";
  kitd = "systemctl stop openvpn-uniVPN.service";
  kitc = "systemctl start openvpn-uniVPN.service";

  config = "git --git-dir=$HOME/.cfg/ --work-tree=$HOME";

}
