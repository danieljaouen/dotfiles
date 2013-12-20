# setup ------------------------------------------------------------------- {{{
set fish_path $HOME/.oh-my-fish
set fish_theme uggedal
set fish_plugins autojump brew bundler django ec2 pyenv python rbenv
# /setup ------------------------------------------------------------------ }}}

# PATH -------------------------------------------------------------------- {{{
set BASE_PATH /bin
set BASE_PATH /sbin $BASE_PATH
set BASE_PATH /usr/bin $BASE_PATH
set BASE_PATH /usr/sbin $BASE_PATH
set BASE_PATH /usr/local/bin $BASE_PATH
set BASE_PATH /usr/local/sbin $BASE_PATH

switch (uname)
    case Darwin
        set LOCAL_PATH /usr/X11/bin
        set LOCAL_PATH /usr/local/opt/ruby/bin $LOCAL_PATH
        set LOCAL_PATH /usr/local/share/npm/bin $LOCAL_PATH
        set LOCAL_PATH /usr/local/var/go/bin $LOCAL_PATH
        set LOCAL_PATH /usr/texbin $LOCAL_PATH
        set LOCAL_PATH $HOME/.bin $LOCAL_PATH
        set -x PATH $PYENV_PATH $RBENV_PATH $LOCAL_PATH $BASE_PATH
    case Linux
        set LOCAL_PATH $HOME/.bin
        set -x PATH $PYENV_PATH $RBENV_PATH $LOCAL_PATH $BASE_PATH
end
# /PATH ------------------------------------------------------------------- }}}

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# OS-specific configuration ----------------------------------------------- {{{
switch (uname)
    case Darwin
        set -x MAIL $HOME/Mail
        set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig
        set -x SHELL /usr/local/bin/fish
        set -x JAVA_HOME (/usr/libexec/java_home)
        set -x PAGER vimpager

        function update
            curl https://raw.github.com/danieljaouen/dotfiles/master/topics/bin/bootstrap.sh | bash
        end

        # aws --------------------------------------------------------------------- {{{
        set -x AWS_CREDENTIAL_FILE "$HOME/.boto"
        set -x JAVA_HOME (/usr/libexec/java_home)
        set -x EC2_PRIVATE_KEY (/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)
        set -x EC2_CERT (/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)
        set -x EC2_HOME "/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"
        # /aws -------------------------------------------------------------------- }}}
    case Linux
        set -x SHELL /usr/bin/fish
        # eval "$(ssh-agent)"
end
# /OS-specific configuration ---------------------------------------------- }}}

# Global Options and Aliases ---------------------------------------------- {{{
set -x EDITOR vim
set -x TERM screen-256color-bce
set -x PYENV_ROOT $HOME/.pyenv
set -x ANSIBLE_NOCOWS 1
# set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

function l
    ls -lah
end
function less
    vimpager
end
function mtr
    sudo mtr -t
end
function mute
    vol 0
end
function n
    newsbeuter
end
function serve_this
    python -m SimpleHTTPServer 8100
end
function t
    task
end
function zless
    $PAGER
end
# /Global Options and Aliases --------------------------------------------- }}}

# ag ---------------------------------------------------------------------- {{{
function agjs
    ag -G '.*\.js$'
end
function agpy
    ag -G '.*\.py$'
end
function aghtml
    ag -G '.*\.html$'
end
function agyml
    ag -G '.*\.yml$'
end
function agrb
    ag -G '.*\.rb$'
end
# /ag --------------------------------------------------------------------- }}}

# ansible ----------------------------------------------------------------- {{{
function a
    ansible
end
function ap
    ansible-playbook
end
function api
    ansible-playbook -i
end
function apik
    ansible-playbook --ask-sudo-pass -i
end
function apvi
    ansible-playbook -vvvv -i
end
function apvik
    ansible-playbook -vvvv --ask-sudo-pass -i
end
function apio
    ansible-playbook -i ~/.ansible.d/inventories/osx
end
function apios
    ansible-playbook -i ~/.ansible.d/inventories/osx ~/.ansible.d/site.yml
end
# /ansible ---------------------------------------------------------------- }}}

# cloc -------------------------------------------------------------------- {{{
function cloc
    cloc --read-lang-def=$HOME/.clocrc
end
# /cloc ------------------------------------------------------------------- }}}

# docker ------------------------------------------------------------------ {{{
function dr
    docker
end
function dri
    docker images
end
function drpl
    docker pull
end
function drps
    docker ps
end
function drpu
    docker push
end
function drr
    docker run
end
function drs
    docker search
end
# /docker ----------------------------------------------------------------- }}}

# elixir ------------------------------------------------------------------ {{{
function m
    mix
end
function mc
    mix compile
end
function mcf
    mix compile --all --force
end
function md
    mix dynamo
end
function mdg
    mix deps.get
end
function mn
    mix new
end
function mwn
    mix weber.new
end
# /elixir ----------------------------------------------------------------- }}}

# erlang ------------------------------------------------------------------ {{{
function re
    rebar
end
# /erlang ----------------------------------------------------------------- }}}

# git --------------------------------------------------------------------- {{{
function gc
    git commit -m
end
function gp
    git
end
function gpu
    git
end
# /git -------------------------------------------------------------------- }}}

# go ---------------------------------------------------------------------- {{{
set -x GOPATH /usr/local/var/go
# /go --------------------------------------------------------------------- }}}

# hg ---------------------------------------------------------------------- {{{
function h
    hg
end
function hc
    hg commit -m
end
function hm
    hg commit -m 'merge.'
end
function hp
    hg
end
function hpu
    hg
end
function hqci
    hg qci
end
function hqf
    hg qf
end
function hqgl
    hg qgl
end
function hqi
    hg qi
end
function hqlog
    hg gqlog
end
function hqn
    hg qn
end
function hqpo
    hg qpo
end
function hqpoa
    hg qpoa
end
function hqpua
    hg qpua
end
function hqq
    hg qq
end
function hqr
    hg qr
end
function hqrm
    hg qrm
end
function hqst
    hg qst
end
function hup
    hg up
end
# /hg --------------------------------------------------------------------- }}}

# javascript/node.js ------------------------------------------------------ {{{
# . ~/.nvm/nvm.sh
# /javascript/node.js ----------------------------------------------------- }}}

# python/django ----------------------------------------------------------- {{{
set -x PYTHONSTARTUP "$HOME/.pythonrc.py"

. $HOME/.virtualfish/virtual.fish
. $HOME/.virtualfish/auto_activation.fish
. $HOME/.virtualfish/global_requirements.fish
set -x VIRTUAL_ENV_DISABLE_PROMPT 0

function daspt
    django-admin.py startproject --template=https://github.com/twoscoops/django-twoscoops-project/archive/master.zip --extension=py,rst,html
end
function fd
    fab dev
end
function pm
    python manage.py
end
function pmm
    'python manage.py migrate'
end
function pmr
    'python manage.py runserver'
end
function pmrp
    'python manage.py runserver_plus'
end
function pmrpg
    'python manage.py runserver_plus --adminmedia=`pwd`/media/admin'
end
function pms
    'python manage.py shell'
end
function pmsdb
    'python manage.py syncdb'
end
function pmsi
    'python manage.py schemamigration --initial'
end
function pmsm
    'python manage.py schemamigration --auto'
end
function pmsp
    'python manage.py shell_plus'
end
function pyr
    'pyenv rehash'
end
# /python/django ---------------------------------------------------------- }}}

# ruby/rails -------------------------------------------------------------- {{{
function b
    bundle
end
function be
    bundle exec
end
function bec
    bundle exec cucumber
end
function beg
    bundle exec rails generate
end
function ber
    bundle exec rake
end
function bers
    bundle exec rspec
end
function bi
    bundle install
end
function bu
    bundle update
end
function rn
    rails new
end
function rt
    rake ctags
end
function rr
    rbenv rehash
end

function bug
    bundle gem $1 --bin --test
end
# /ruby/rails ------------------------------------------------------------- }}}

# vagrant ----------------------------------------------------------------- {{{
function v
    vagrant
end
function vp
    vagrant provision
end
function vs
    vagrant suspend
end
function vup
    vagrant up
end
function vupa
    vagrant up --provider=aws
end
# /vagrant ---------------------------------------------------------------- }}}

# Local Configuration ----------------------------------------------------- {{{
if test -s $HOME/.fishrc.local
    source $HOME/.fishrc.local
end
# /Local Configuration ---------------------------------------------------- }}}
