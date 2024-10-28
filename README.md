sudo python3 -m venv ansible

source ansible/bin/activate

python3 -m pip install --upgrade pip

pip install ansible

sudo apt-get install python3-dev libkrb5-dev krb5-user

pip install pywinrm[kerberos]

ansible windows -m win_ping -i kerberos_hosts -vvvv
