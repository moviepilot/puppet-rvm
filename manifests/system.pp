class rvm::system($version='latest') {
  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => "bash -c '/usr/bin/curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o /tmp/rvm-installer ; \
                chmod +x /tmp/rvm-installer ; \
                rvm_bin_path=/usr/local/rvm/bin rvm_man_path=/usr/local/rvm/man /tmp/rvm-installer --version ${version} ; \
                rm /tmp/rvm-installer'",
    creates => '/usr/local/rvm/bin/rvm',
    require => [
      Class['rvm::dependencies'],
    ],
  }
  file {
    '/usr/local/bin/bundle':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/bundle';
    '/usr/local/bin/rake':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rake';
    '/usr/local/bin/rvm':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm';
    '/usr/local/bin/rvm-auto-ruby':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-auto-ruby';
    '/usr/local/bin/rvm-exec':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-exec';
    '/usr/local/bin/rvm-installer':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-installer';
    '/usr/local/bin/rvm-prompt':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-prompt';
    '/usr/local/bin/rvm-shell':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-shell';
    '/usr/local/bin/rvm-smile':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvm-smile';
    '/usr/local/bin/rvmsudo':
      ensure => link,
      require => Exec['system-rvm'],
      target => '/usr/local/rvm/bin/rvmsudo';
    }
}





