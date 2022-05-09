sudo touch /etc/apt/apt.conf.d/proxy.conf
proxy="http://10.117.42.69:6969"
echo "Acquire::http::Proxy \"$proxy\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
echo "Acquire::https::Proxy \"$proxy\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf
echo "http_proxy=$proxy" | sudo tee -a /etc/bash.bashrc
echo "https_proxy=$proxy" | sudo tee -a /etc/bash.bashrc
git config --global https.proxy $proxy
git config --global http.proxy $proxy
sudo dpkg -i https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb
git-credential-manager-core configure
git config --global credential.credentialStore caches
#date -s "2 OCT 2006 18:00:00"