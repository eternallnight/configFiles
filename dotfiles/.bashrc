# vim: ft=sh

# No brainer, default to Vim
export EDITOR="vim"

# Color LS output to differentiate between directories and files
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""

# Customize Path
export PATH=$HOME/bin:$PATH

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="\[\e[36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] $ "

#aliases
alias icinga='ssh root@77.81.247.53 -p 8888'
alias vpn-up='nmcli con up id ELvsoft'
alias vpn-down='nmcli con down id ELvsoft'

#NL
alias nl88='ssh marian.chelmus@10.9.10.122 -p 8888'
alias nl43='ssh marian.chelmus@10.9.10.102 -p 8888'
alias nl42='ssh marian.chelmus@10.9.11.101 -p 8888'
alias nl46='ssh marian.chelmus@10.9.11.103 -p 8888'
alias nl48='ssh marian.chelmus@10.9.11.105 -p 8888'
alias nl49='ssh marian.chelmus@10.9.11.106 -p 8888'
alias nl50='ssh marian.chelmus@10.9.11.107 -p 8888'
alias nl52='ssh marian.chelmus@10.9.11.117 -p 8888'
alias nl43='ssh marian.chelmus@10.9.10.102 -p 8888'
alias nl55='ssh marian.chelmus@10.9.10.110 -p 8888'
alias nl57='ssh marian.chelmus@10.9.11.112 -p 8888'
alias nl58='ssh marian.chelmus@10.9.11.113 -p 8888'
alias nl75='ssh marian.chelmus@10.9.10.116 -p 8888'
alias nl67='ssh marian.chelmus@10.9.10.118 -p 8888'
alias nl68='ssh marian.chelmus@10.9.10.115 -p 8888'
alias nl75='ssh marian.chelmus@10.9.10.116 -p 8888'
alias nl76='ssh marian.chelmus@10.9.10.119 -p 8888'
alias nl80='ssh marian.chelmus@10.9.10.120 -p 8888'
alias nl87='ssh marian.chelmus@10.9.10.121 -p 8888'
alias nl88='ssh marian.chelmus@10.9.10.122 -p 8888'
alias nl104='ssh marian.chelmus@10.9.14.2 -p 8888'
alias nl105='ssh marian.chelmus@10.9.14.3 -p 8888'
alias nl106='ssh marian.chelmus@10.9.14.4 -p 8888'
alias nl121='ssh marian.chelmus@10.9.10.123 -p 8888'
alias nl122='ssh marian.chelmus@10.9.10.124 -p 8888'
alias nl123='ssh marian.chelmus@10.9.14.6 -p 8888'
alias nl124='ssh marian.chelmus@10.9.14.7 -p 8888'
alias nl125='ssh marian.chelmus@10.9.14.8 -p 8888'
alias nl126='ssh marian.chelmus@10.9.14.9 -p 8888'
alias nl127='ssh marian.chelmus@10.9.14.10 -p 8888'
alias nl129='ssh marian.chelmus@10.9.10.125 -p 8888'
alias nl144='ssh marian.chelmus@10.9.14.11 -p 8888'
alias nl145='ssh marian.chelmus@10.9.14.12 -p 8888'
alias nl146='ssh marian.chelmus@10.9.14.14 -p 8888'
alias nl147='ssh marian.chelmus@10.9.14.15 -p 8888'
alias nl149='ssh marian.chelmus@10.9.14.17 -p 8888'
alias nl150='ssh marian.chelmus@10.9.14.18 -p 8888'
alias nl151='ssh marian.chelmus@10.9.14.19 -p 8888'
alias nl157='ssh marian.chelmus@10.9.14.20 -p 8888'
alias nl158='ssh marian.chelmus@10.9.14.21 -p 8888'
alias nl159='ssh marian.chelmus@10.9.14.22 -p 8888'

#USD
alias usd26='ssh marian.chelmus@10.9.11.19 -p 8888'
alias usd27='ssh marian.chelmus@10.9.11.18 -p 8888'
alias usd28='ssh marian.chelmus@10.9.11.3  -p 8888'
alias usd29='ssh marian.chelmus@10.9.11.2 -p 8888'
alias usd33='ssh marian.chelmus@10.9.11.17 -p 8888'
alias usd34='ssh marian.chelmus@10.9.11.4 -p 8888'
alias usd38='ssh marian.chelmus@10.9.11.5 -p 8888'
alias usd40='ssh marian.chelmus@10.9.11.6 -p 8888'
alias usd45='ssh marian.chelmus@10.9.11.15 -p 888'
alias usd51='ssh marian.chelmus@10.9.11.16 -p 8888'
alias usd63='ssh marian.chelmus@10.9.11.26 -p 8888'
alias usd64='ssh marian.chelmus@10.9.11.9 -p 8888'
alias usd65='ssh marian.chelmus@10.9.11.10 -p 8888'
alias usd71='ssh marian.chelmus@10.9.11.22 -p 8888'
alias usd72='ssh marian.chelmus@10.9.11.12 -p 8888'
alias usd73='ssh marian.chelmus@10.9.11.13 -p 8888'
alias usd74='ssh marian.chelmus@10.9.11.14 -p 8888'
alias usd81='ssh marian.chelmus@10.9.11.20 -p 8888'
alias usd82='ssh marian.chelmus@10.9.11.21 -p 8888'
alias usd114='ssh marian.chelmus@10.9.11.23 -p 8888'
alias usd115='ssh marian.chelmus@10.9.11.24 -p 8888'
alias usd130='ssh marian.chelmus@10.9.11.25 -p 8888'
alias usd131='ssh marian.chelmus@10.9.11.7 -p 8888'
alias usd132='ssh marian.chelmus@10.9.11.3 -p 8888'
alias usd137='ssh marian.chelmus@10.9.11.8 -p 8888'
alias usd138='ssh marian.chelmus@10.9.11.27 -p 8888'
alias usd162='ssh marian.chelmus@10.9.11.31 -p 8888'
alias usd163='ssh marian.chelmus@10.9.11.32 -p 8888'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#my env
alias ansible-master='ssh root@188.241.118.206 -p 8888'
alias workvps='ssh root@89.33.197.188 -p 8888'
alias ansible='ssh root@188.241.118.155 -p 22'
alias docker='ssh root@188.241.118.181 -p 22'
alias union='ssh root@server.union-trade.ro -p 8888'

#shared
alias selena='ssh root@selena.hosterion.net -p 8888'
alias apollo='ssh root@apollo.elvsoft.net -p 8888'
alias artemis='ssh root@artemis.elvsoft.net -p 8888'
alias athena='ssh root@athena.elvsoft.net -p 8888'
alias eos='ssh root@eos.elvsoft.net -p 8888'
alias hera='ssh root@hera.elvsoft.net -p 8888'
alias maia='ssh root@maia.elvsoft.net -p 8888'
alias backupro2='ssh root@backupro2.elvsoft.net -p 8888'
alias git.fleio.org='ssh root@git.fleio.org -p 8888'
alias leto='ssh root@leto.elvsoft.net -p 8888'
alias iris='ssh root@iris.hosterion.net -p 8888'
alias nemesis='ssh root@nemesis.hosterion.net -p 8888'
alias aega='ssh root@aega.hosterion.net -p 8888'
alias hades='ssh root@hades.hosterion.net -p 8888'
alias pegasus='ssh root@pegasus.hosterion.net -p 8888'
alias erebus='ssh root@erebus.hosterion.net -p 8888'
alias argos='ssh root@argos.hosterion.net -p 8888'
alias dione='ssh root@dione.hosterion.net -p 8888'
alias heimdall='ssh root@heimdall.hosterion.net -p 8888'
#RO

alias ro79='ssh marian.chelmus@10.9.7.118 -p 8888'
alias ro89='ssh marian.chelmus@10.9.7.100 -p 8888'
alias ro90='ssh marian.chelmus@10.9.7.101 -p 8888'
alias ro91='ssh marian.chelmus@10.9.7.102 -p 8888'
alias ro92='ssh marian.chelmus@10.9.7.103 -p 8888'
alias ro93='ssh marian.chelmus@10.9.7.104 -p 8888'
alias ro94='ssh marian.chelmus@10.9.7.105 -p 8888'
alias ro95='ssh marian.chelmus@10.9.7.106 -p 8888'
alias ro96='ssh marian.chelmus@10.9.7.107 -p 8888'
alias ro97='ssh marian.chelmus@10.9.7.108 -p 8888'
alias ro98='ssh marian.chelmus@10.9.7.109 -p 8888'
alias ro99='ssh marian.chelmus@10.9.7.110 -p 8888'
alias ro100='ssh marian.chelmus@10.9.7.111 -p 8888'
alias ro101='ssh marian.chelmus@10.9.7.112 -p 8888'
alias ro107='ssh marian.chelmus@10.9.7.113 -p 8888'
alias ro108='ssh marian.chelmus@10.9.7.114 -p 8888'
alias ro109='ssh marian.chelmus@10.9.7.115 -p 8888'
alias ro110='ssh marian.chelmus@10.9.7.116 -p 8888'
alias ro111='ssh marian.chelmus@10.9.7.117 -p 8888'
alias ro116='ssh marian.chelmus@10.9.7.121 -p 8888'
alias ro117='ssh marian.chelmus@10.9.7.123 -p 8888'
alias ro118='ssh marian.chelmus@10.9.7.124 -p 8888'
alias ro134='ssh marian.chelmus@10.9.7.128 -p 8888'
alias ro135='ssh marian.chelmus@10.9.7.129 -p 8888'
alias ro136='ssh marian.chelmus@10.9.7.130 -p 8888'
alias ro155='ssh marian.chelmus@10.9.7.119 -p 8888'
alias ro156='ssh marian.chelmus@10.9.7.137 -p 8888'

#UK

alias uk83='ssh marian.chelmus@10.9.13.2 -p 8888'
alias uk84='ssh marian.chelmus@10.9.13.3 -p 8888'
alias uk85='ssh marian.chelmus@10.9.13.4 -p 8888'
alias uk86='ssh marian.chelmus@10.9.13.5 -p 8888'
alias uk102='ssh marian.chelmus@10.9.13.6 -p 8888'
alias uk103='ssh marian.chelmus@10.9.13.7 -p 8888'
alias uk119='ssh marian.chelmus@10.9.13.8 -p 8888'
alias uk120='ssh marian.chelmus@10.9.13.9 -p 8888'
alias uk140='ssh marian.chelmus@10.9.13.10 -p 8888'
alias uk141='ssh marian.chelmus@10.9.13.11 -p 8888'
alias uk142='ssh marian.chelmus@10.9.13.12 -p 8888'
alias uk152='ssh marian.chelmus@10.9.13.13 -p 8888'
alias uk153='ssh marian.chelmus@10.9.13.14 -p 8888'
alias uk143='ssh marian.chelmus@10.9.13.16 -p 8888'
alias uk154='ssh marian.chelmus@10.9.13.15 -p 8888'
alias uk160='ssh marian.chelmus@10.9.13.17 -p 8888'
alias uk161='ssh marian.chelmus@10.9.13.18 -p 8888'

#USF

alias usf59='ssh marian.chelmus@10.9.12.2 -p 8888'
alias usf60='ssh marian.chelmus@10.9.12.3 -p 8888'
alias usf62='ssh marian.chelmus@10.9.12.4 -p 8888'
alias usf70='ssh marian.chelmus@10.9.12.5 -p 8888'
alias usf77='ssh marian.chelmus@10.9.12.6 -p 8888'
alias usf78='ssh marian.chelmus@10.9.12.7 -p 8888'
alias usf112='ssh marian.chelmus@10.9.12.8 -p 8888'
alias usf113='ssh marian.chelmus@10.9.12.9 -p 8888'
alias usf133='ssh marian.chelmus@10.9.12.10 -p 8888'
alias usf139='ssh marian.chelmus@10.9.12.11 -p 8888'
alias usf164='ssh marian.chelmus@10.9.12.12 -p 8888'
alias usf165='ssh marian.chelmus@10.9.12.13 -p 8888'



