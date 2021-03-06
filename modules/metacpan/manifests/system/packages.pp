class metacpan::system::packages {

    # Editors
    package { 'vim': ensure => present }

    # System Tools
    package { bzip2: ensure => present }
    package { curl: ensure => present }
    package { diffutils: ensure => present }
    package { lynx: ensure => present }
    package { mtr: ensure => present }
    package { wget: ensure => present }

    package { htop: ensure => present }
    package { iotop: ensure => present }
    package { psmisc: ensure => present } # killall pstree fuser commands
    package { rsync: ensure => present }
    package { screen: ensure => present }

    # for backup mounts on bytemark servers
    package { "nfs-common": ensure => present }

    # Shells
    package { zsh: ensure => present } # for rafl
    package { byobu: ensure => present } # for mo
    package { tmux:  ensure => present } # for rwstauner

    package { ack-grep: ensure => present }
    package { less: ensure => present }
    package { mosh: ensure => present }
    package { ncdu: ensure => present }
    package { tig: ensure => present }
    package { postgresql-server-dev-all: ensure => present }
    package { sqlite3: ensure => present }
    package { sudo: ensure => present }
    package { sysstat: ensure => present }
    package { tree: ensure => present }
    package { whois: ensure => present }

    package { ntp: ensure => present }
    # package { exim: ensure => present } # TODO: FIX

    # Stuff for firewall / security
    package { chkrootkit: ensure => present }
    package { iptables: ensure => installed }
    package { iptables-persistent: ensure => present }

    # Euuu - nasty, remove
    package { nano: ensure => absent }

    # updatedb was chewing up IO and we don't use it
    package { locate: ensure => absent }

    package{ build-essential: ensure => present }

    # Helped get Elasticsearch running
    # https://ask.puppetlabs.com/question/2147/could-not-find-a-suitable-provider-for-augeas/
    package{ libaugeas-ruby: ensure => present }

    case $operatingsystem {
      Debian: {
      }
      default: {
        Package{ provider => apt }
      }
    }

    # Install a few utilities through node/npm.
    npm::install {
        [
            'js-beautify',
            'cssunminifier',
        ]:
    }
    npm::install { 'less':
      exe => 'lessc',
    }

}
