echo 'alias cl="clear"' >> ~/.bash_profile
echo 'alias py="python3"' >> ~/.bash_profile

yum install git wget -y

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

source ~/.bash_profile

yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel
pyenv install 3.7.0
pyenv global 3.7.0

wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.23-8c2f2715.tar.gz
tar -xvzf geth-linux-amd64-1.9.23-8c2f2715.tar.gz
mv geth-linux-amd64-1.9.23-8c2f2715 geth
cd geth && cp geth /usr/local/bin && cd ..

nohup geth --datadir /data/geth --rpc --ws --syncmode fast &

