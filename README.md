sudo python3 -m venv py-ansible

sudo source py-ansible/bin/activate

sudo pip install ansible

sudo apt-get update

sudo python3 -m pip install --upgrade pip

sudo apt-get install build-essential gcc python3-dev libkrb5-dev python3-dev libkrb5-dev krb5-user

sudo pip install pywinrm[kerberos]

---

ansible windows -m win_ping -i kerberos_hosts -vvvv
