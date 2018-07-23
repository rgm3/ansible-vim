# Basic vim configuration

Install my preferred basic vim configuration based on
[vim-plug][1].

[1]: https://github.com/junegunn/vim-plug

## Install with shell on local box

```bash
curl -fsSL "https://raw.githubusercontent.com/rgm3/ansible-vim/master/install.sh" | bash
```

## Install with ansible

```bash
# Install locally for the current user
ansible-playbook -c local -i localhost, playbook.yml

# Install on a remote server for a different user
ansible-playbook -i raspberrypi.local, -u pi --ask-pass playbook.yml
```
