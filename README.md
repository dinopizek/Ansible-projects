sudo python3 -m venv ansible

source ansible/bin/activate

python3 -m pip install --upgrade pip

pip install ansible

sudo apt-get install python3-dev libkrb5-dev krb5-user

pip install pywinrm[kerberos]

--------------------------------------------------------------------------------------------------
| transport   | local accounts | active directory accounts | credentials delegation | encryption |
|-------------|----------------|---------------------------|------------------------|------------|
| basic       | yes            | no                        | no                     | no         |
| certificate | yes            | no                        | no                     | no         |
| kerberos    | no             | yes                       | yes                    | yes        |
| ntlm        | yes            | yes                       | no                     | yes        |
| credssp     | yes            | yes                       | yes                    | yes        |
--------------------------------------------------------------------------------------------------

ansible windows -m win_ping -i kerberos_hosts -vvvv
