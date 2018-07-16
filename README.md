vimrc for neovim
================

Mac
---
## neovim install
```
$ brew install neovim
```

Linux
-----
## neovim repo add
```
$ sudo -E add-apt-repository ppa:neovim-ppa/stable && \
$ sudo -E apt-get update -y
```

## python install
```
$ sudo apt-get install python-pip python-dev python3-venv build-essential -y && \
$ pip install --upgrade pip
```

## neovim install
```
$ sudo -E apt-get install neovim -y && \
$ sudo -E pip install --upgrade virtualenv && \
$ sudo -E pip install --upgrade neovim && \
$ sudo -E pip3 install --upgrade neovim
```

## config update
```
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
$ sudo update-alternatives --config vi && \
$ sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
$ sudo update-alternatives --config vim && \
$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && \
$ sudo update-alternatives --config editor
```

Common
------

## plug.vim install
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ link .vimrc to init.vim(neovim config file)
$ mkdir -p ~/.config/nvim \
&& touch ~/.config/nvim/init.vim \
&& echo `set runtimepath+=~/.vim,~/.vim/after\nset packpath+=~/.vim\nsource ~/.vimrc` >> ~/.config/nvim/init.vim
```

## deoplete remote update
in the vim
```
:PythonSupportInitPython2
:PythonSupportInitPython3
:UpdateRemotePlugins
```

## deoplete.vim settings

### Python
```
$ pip install jedi
```

### Clang
```
$ apt-get install clang
  or
$ brew install llvm --with-clang
```

#### g:deoplete#sources#clang#libclang_path
> `path/to/lib/libclang.so`
```
[sudo] find / -name libclang.so
mdfind -name libclang.dylib
```

#### g:deoplete#sources#clang#clang_header
> `path/to/lib/clang`
```
exp: /opt/llvm/lib/clang
```

#### g:deoplete#sources#clang#std

##### C Default
> c11
##### C++ Default
> c++1z
##### Objective-C Default
> c11
##### Objective-C++ Default
> c++1z
##### Example
> {'c': 'c11', 'cpp': 'c++1z', 'objc': 'c11', 'objcpp': 'c++1z'}

#### g:deoplete#sources#clang#flags

##### C Default
['-x', 'c']
##### C++ Default
['-x', 'c++']
##### Objective-C Default
['-x', 'objective-c']
##### Objective-C++ Default
['-x', 'objective-c++']
##### Example
["-fblocks",]

### Go
```
go get -u github.com/nsf/gocode
```

### JSON
```
apt-get install jq
```

## Ale(Asynchronous lint engine) settings
```
apt-get install -y jq
pip install autopep8 flake8 pycodestyle==2.3.0
```
