# setup ------------------------------------------------------------------- {{{
set fish_path $HOME/.oh-my-fish
set fish_theme danieljaouen
set fish_plugins autojump brew bundler django pyenv rbenv
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
        set -x GOPATH /usr/local/var/go
        set LOCAL_PATH /usr/X11/bin
        set LOCAL_PATH /usr/texbin $LOCAL_PATH
        set LOCAL_PATH /usr/local/opt/ruby/bin $LOCAL_PATH
        set LOCAL_PATH /usr/local/share/npm/bin $LOCAL_PATH
        set LOCAL_PATH $GOPATH/bin $LOCAL_PATH
        set LOCAL_PATH $HOME/.bin $LOCAL_PATH
        set -x PATH $LOCAL_PATH $BASE_PATH
    case Linux
        set -x GOPATH /var/go
        set LOCAL_PATH $GOPATH/bin
        set LOCAL_PATH $HOME/.bin $LOCALPATH
        set -x PATH $LOCAL_PATH $BASE_PATH
end
# /PATH ------------------------------------------------------------------- }}}

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

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
set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

function l
    command ls -lah $argv
end
function less
    command vimpager
end
function mtr
    command sudo mtr -t $argv
end
function mute
    command vol 0 $argv
end
function n
    command newsbeuter $argv
end
function serve_this
    command python -m SimpleHTTPServer 8100 $argv
end
function t
    command task $argv
end
function zless
    command $PAGER $argv
end
function ...
    cd ../..
end
# /Global Options and Aliases --------------------------------------------- }}}

# ag ---------------------------------------------------------------------- {{{
function agjs
    command ag -G '.*\.js$' $argv
end
function agpy
    command ag -G '.*\.py$' $argv
end
function aghtml
    command ag -G '.*\.html$' $argv
end
function agyml
    command ag -G '.*\.yml$' $argv
end
function agrb
    command ag -G '.*\.rb$' $argv
end
# /ag --------------------------------------------------------------------- }}}

# ansible ----------------------------------------------------------------- {{{
function a
    command ansible $argv
end
function ap
    command ansible-playbook $argv
end
function api
    command ansible-playbook -i $argv
end
function apik
    command ansible-playbook --ask-sudo-pass -i $argv
end
function apvi
    command ansible-playbook -vvvv -i $argv
end
function apvik
    command ansible-playbook -vvvv --ask-sudo-pass -i $argv
end
function apio
    command ansible-playbook -i ~/.ansible.d/inventories/osx $argv
end
function apios
    command ansible-playbook -i ~/.ansible.d/inventories/osx ~/.ansible.d/site.yml $argv
end
# /ansible ---------------------------------------------------------------- }}}

# salt -------------------------------------------------------------------- {{{
function sk
    command salt-key $argv
end
function skd
    command salt-key -c $HOME/.virtualenvs/salt/etc/salt $argv
end

function sc
    command salt-call $argv
end
function scd
    command salt-call -c $HOME/.virtualenvs/salt/etc/salt $argv
end

function smi
    command salt-minion $argv
end
function smid
    command salt-minion -c $HOME/.virtualenvs/salt/etc/salt $argv
end

function sma
    command salt-master $argv
end
function smad
    command salt-master -c $HOME/.virtualenvs/salt/etc/salt $argv
end
# /salt ------------------------------------------------------------------- }}}

# puppet ------------------------------------------------------------------ {{{
function pa
    command puppet apply $argv
end
# /puppet ----------------------------------------------------------------- }}}

# cloc -------------------------------------------------------------------- {{{
function cloc
    command cloc --read-lang-def=$HOME/.clocrc $argv
end
# /cloc ------------------------------------------------------------------- }}}

# docker ------------------------------------------------------------------ {{{
function dr
    command docker $argv
end
function dri
    command docker images $argv
end
function drpl
    command docker pull $argv
end
function drps
    command docker ps $argv
end
function drpu
    command docker push $argv
end
function drr
    command docker run $argv
end
function drs
    command docker search $argv
end
# /docker ----------------------------------------------------------------- }}}

# elixir ------------------------------------------------------------------ {{{
function m
    command mix $argv
end
function mc
    command mix compile $argv
end
function mcf
    command mix compile --all --force $argv
end
function md
    command mix dynamo $argv
end
function mdg
    command mix deps.get $argv
end
function mn
    command mix new $argv
end
function mwn
    command mix weber.new $argv
end
# /elixir ----------------------------------------------------------------- }}}

# erlang ------------------------------------------------------------------ {{{
function re
    command rebar $argv
end

function erlpa
    command erl -pa ebin deps/*/ebin
end
# /erlang ----------------------------------------------------------------- }}}

# git --------------------------------------------------------------------- {{{
function g
    command git $argv
end
function gc
    command git commit -m $argv
end
function gp
    command git $argv
end
function gpu
    command git $argv
end
function gap
    command git add -p
end
# /git -------------------------------------------------------------------- }}}

# go ---------------------------------------------------------------------- {{{
# /go --------------------------------------------------------------------- }}}

# hg ---------------------------------------------------------------------- {{{
function h
    command hg $argv
end
function hc
    command hg commit -m $argv
end
function hm
    command hg commit -m 'merge.' $argv
end
function hp
    command hg $argv
end
function hpu
    command hg $argv
end
function hqci
    command hg qci $argv
end
function hqf
    command hg qf $argv
end
function hqgl
    command hg qgl $argv
end
function hqi
    command hg qi $argv
end
function hqlog
    command hg gqlog $argv
end
function hqn
    command hg qn $argv
end
function hqpo
    command hg qpo $argv
end
function hqpoa
    command hg qpoa $argv
end
function hqpua
    command hg qpua $argv
end
function hqq
    command hg qq $argv
end
function hqr
    command hg qr $argv
end
function hqrm
    command hg qrm $argv
end
function hqst
    command hg qst $argv
end
function hup
    command hg up $argv
end
# /hg --------------------------------------------------------------------- }}}

# javascript/node.js ------------------------------------------------------ {{{
# . ~/.nvm/nvm.sh
function gu
    command grunt $argv
end
# /javascript/node.js ----------------------------------------------------- }}}

# python/django ----------------------------------------------------------- {{{
set -x PYTHONSTARTUP "$HOME/.pythonrc.py"

set -x VIRTUALFISH_COMPAT_ALIASES 1
source $HOME/.virtualfish/virtual.fish
source $HOME/.virtualfish/auto_activation.fish
source $HOME/.virtualfish/global_requirements.fish
set -x VIRTUAL_ENV_DISABLE_PROMPT 0

function daspt
    command django-admin.py startproject --template=https://github.com/twoscoops/django-twoscoops-project/archive/master.zip --extension=py,rst,html $argv
end
function fd
    command fab dev $argv
end
function pm
    command python manage.py $argv
end
function pmm
    command 'python manage.py migrate' $argv
end
function pmr
    command 'python manage.py runserver' $argv
end
function pmrp
    command 'python manage.py runserver_plus' $argv
end
function pmrpg
    command 'python manage.py runserver_plus --adminmedia=`pwd`/media/admin' $argv
end
function pms
    command 'python manage.py shell' $argv
end
function pmsdb
    command 'python manage.py syncdb' $argv
end
function pmsi
    command 'python manage.py schemamigration --initial' $argv
end
function pmsm
    command 'python manage.py schemamigration --auto' $argv
end
function pmsp
    command 'python manage.py shell_plus' $argv
end
function pyr
    command 'pyenv rehash' $argv
end
# /python/django ---------------------------------------------------------- }}}

# ruby/rails -------------------------------------------------------------- {{{
function b
    command bundle $argv
end
function be
    command bundle exec $argv
end
function bec
    command bundle exec cucumber $argv
end
function beg
    command bundle exec rails generate $argv
end
function ber
    command bundle exec rake $argv
end
function bers
    command bundle exec rspec $argv
end
function bi
    command bundle install $argv
end
function bu
    command bundle update $argv
end
function rn
    command rails new $argv
end
function rt
    command rake ctags $argv
end
function rr
    command rbenv rehash $argv
end

function bug
    command bundle gem $1 --bin --test $argv
end
# /ruby/rails ------------------------------------------------------------- }}}

# puppet ------------------------------------------------------------------ {{{
function lp
    command librarian-puppet $argv
end
# /puppet ----------------------------------------------------------------- }}}

# vagrant ----------------------------------------------------------------- {{{
function v
    command vagrant $argv
end
function vp
    command vagrant provision $argv
end
function vs
    command vagrant suspend $argv
end
function vup
    command vagrant up $argv
end
function vupa
    command vagrant up --provider=aws $argv
end
# /vagrant ---------------------------------------------------------------- }}}

# tmux -------------------------------------------------------------------- {{{
function tms
    command tmux -S /tmp/shareds new -s shared $argv
end
function tma
    command tmux -S /tmp/shareds attach -t shared $argv
end
# /tmux ------------------------------------------------------------------- }}}

# Local Configuration ----------------------------------------------------- {{{
if test -s $HOME/.fishrc.local
    source $HOME/.fishrc.local
end
# /Local Configuration ---------------------------------------------------- }}}
