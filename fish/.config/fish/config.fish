if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -- _C \|\ pbcopy
    abbr -a -- _G \|\ grep\ -ni
    abbr -a -- _L \|\ less
    abbr -a -- _NULL \&\>/dev/null
    abbr -a -- _T \|\ tee\ -a
    abbr -a -- _Z \|\ fzf
    abbr -a -- act source\ .venv/bin/activate
    abbr -a -- curlh curl\ -I
    abbr -a -- dco docker\ compose
    abbr -a -- dcou docker\ compose\ up\ -d\ --remove-orphans
    abbr -a --set-cursor -- dcr docker\ compose\ run\ -it\ %\ --rm
    abbr -a -- deact deactivate
    abbr -a -- dfh df\ -h
    abbr -a -- digs dig\ +short
    abbr -a -- dk docker
    abbr -a -- dkbd docker\ build\ .
    abbr -a --set-cursor -- dkbt docker\ build\ -t\ %\ .
    abbr -a --set-cursor -- dke docker\ exec\ -it\ %\ /bin/bash
    abbr -a -- dki docker\ images
    abbr -a --set-cursor -- dkig docker\ images\ \|\ grep\ %\ \|\ awk\ \'\{print\ \$3\}\'
    abbr -a -- dkpa docker\ system\ prune\ -a
    abbr -a -- dkr docker\ run\ -it
    abbr -a -- drid docker\ rmi\ -f\ \$\(docker\ images\ -q\ -f\ \"dangling=true\"\)
    abbr -a -- eof \<\<EOF
    abbr -a -- freeze uv\ pip\ freeze\ \>\ requirements.txt
    abbr -a -- gb git\ branch
    abbr -a -- gblackchanged black\ \$\(git\ diff\ --name-only\ \"\$\(git\ merge-base\ HEAD\ origin/main\)\"...HEAD\ \|\ grep\ -E\ \"\.py\$\"\)
    abbr -a -- gblacknew black\ \$\(git\ diff\ --name-only\ --diff-filter=A\ \"\$\(git\ merge-base\ HEAD\ origin/main\)\"...HEAD\ \|\ grep\ -E\ \"\.py\$\"\)
    abbr -a -- gc git\ commit
    abbr -a -- gchanged git\ diff\ --name-only\ \"\$\(git\ merge-base\ HEAD\ origin/main\)\"...HEAD
    abbr -a -- gd git\ diff
    abbr -a -- gf git\ fetch\ --prune\ --tags
    abbr -a -- gl git\ log
    abbr -a -- glg git\ log\ --graph\ --oneline
    abbr -a -- glgl git\ log\ --graph\ --oneline\ --all
    abbr -a -- gr git\ reset\ --mixed
    abbr -a -- grh git\ reset\ --hard
    abbr -a -- grs git\ reset\ --soft
    abbr -a -- gs git\ status\ -s
    abbr -a -- gss git\ status
    abbr -a -- hz history\ 1\ \|\ fzf
    abbr -a -- k kubectl
    abbr -a -- kctx kubectl\ config\ use-context
    abbr -a -- kdp kubectl\ describe\ pod
    abbr -a -- kex kubectl\ exec\ -it
    abbr -a -- kga kubectl\ get\ all
    abbr -a -- kgn kubectl\ get\ nodes
    abbr -a -- kgp kubectl\ get\ pods
    abbr -a -- kl kubectl\ logs
    abbr -a -- kns kubectl\ config\ set-context\ --current\ --namespace
    abbr -a -- lock uv\ lock
    abbr -a --set-cursor -- manz apropos\ %\ \|\ fzf\ \|\ cut\ -f1,2\ -d\'\ \'\ \|\ xargs\ man
    abbr -a -- nslook nslookup
    abbr -a -- ping5 ping\ -c\ 5
    abbr -a -- psa ps\ aux
    abbr -a -- req uv\ pip\ install\ -r\ requirements.txt
    abbr -a -- sync uv\ sync
    abbr -a -- tracer traceroute
    abbr -a -- unstage git\ restore\ --staged
    abbr -a -- upt uptime
    abbr -a -- uvadd uv\ add
    abbr -a -- uvi uv\ pip\ install
    abbr -a -- uvl uv\ pip\ list
    abbr -a -- uvr uv\ pip\ uninstall
    abbr -a -- venv uv\ venv
    abbr -a -- wgetr wget\ -r
    abbr -a -- whoa who\ -a
    abbr -a --set-cursor -- db echo\ \"export\ DB_NAME=%\"\ \>\~/.db-env\ \&\&\ source\ \~/.db-env
    abbr -a --set-cursor -- t task\ %
end
