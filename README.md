# Archive

Install the script and Systemd timer on a remote machine:

```console
export TARGET=io

ssh $TARGET mkdir -p /home/$(whoami)/.local/bin
scp archive.sh $TARGET:/home/$(whoami)/.local/bin/archive.sh
ssh $TARGET chmod +x /home/$(whoami)/.local/bin/archive.sh

ssh $TARGET mkdir -p ~/.config/systemd/user
scp archive.service $TARGET:~/.config/systemd/user/archive.service
scp archive.timer $TARGET:~/.config/systemd/user/archive.timer

ssh $TARGET systemctl --user enable archive.timer
ssh $TARGET systemctl --user start archive.timer

ssh $TARGET mkdir -p /home/$(whoami)/mnt/archive
ssh $TARGET mkdir -p /home/$(whoami)/nas/archive
```

Add the following to `/etc/fstab`:

```console
//NAS/Archive    /home/kyle/nas/archive    cifs    _netdev,nofail,ro,username=kyle,password=[REDACTED],workgroup=WORKGROUP,iocharset=utf8,uid=kyle,gid=kyle	   0    0
/dev/sda1    	 /home/kyle/mnt/archive    ext4    defaults	                                                                                                   0    0
```

## Troubleshooting

```
journalctl --user -u archive.service -f
```

```
systemctl --user status archive.timer
systemctl --user status archive.service
```
