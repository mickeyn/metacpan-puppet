# Just for production servers
class metacpan::web::production(
    $user = hiera('metacpan::user', 'metacpan'),
    $group = hiera('metacpan::group', 'metacpan'),
) {

  file { "/home/${user}/metacpan-web/metacpan_web_local.conf":
      ensure => file,
      owner => $user,
      group => $group,
      source => "puppet:///private/metacpan-web/metacpan_web_local.conf",
      require => Metacpan::Gitrepo['gitrepo_metacpan-web'], # after repo created
      notify => Starman::Service['metacpan-web'],
  }

  file { "/home/${user}/metacpan-api/metacpan_server_local.conf":
      ensure => file,
      owner => $user,
      group => $group,
      source => "puppet:///private/metacpan-api/metacpan_server_local.conf",
      require => Metacpan::Gitrepo['gitrepo_metacpan-api'], # after repo created
      notify => Starman::Service['metacpan-api'],
  }

  file { "/home/${user}/github-meets-cpan/environment.json":
      ensure => file,
      owner => $user,
      group => $group,
      source => "puppet:///private/github-meets-cpan/environment.json",
      require => Metacpan::Gitrepo['gitrepo_github-meets-cpan'], # after repo created
      notify => Starman::Service['github-meets-cpan'],
  }


}
