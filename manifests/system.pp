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
    '/usr/local/bin/rvm':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm';
      require => Exec['system-rvm'],
    '/usr/local/bin/bundle':
      ensure => link,
      target => '/usr/local/rvm/bin/bundle';
      require => Exec['system-rvm'],
    '/usr/local/bin/rake':
      ensure => link,
      target => '/usr/local/rvm/bin/rake';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-auto-ruby':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-auto-ruby';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-exec':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-exec';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-installer':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-installer';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-prompt':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-prompt';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-shell':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-shell';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvm-smile':
      ensure => link,
      target => '/usr/local/rvm/bin/rvm-smile';
      require => Exec['system-rvm'],
    '/usr/local/bin/rvmsudo':
      ensure => link,
      target => '/usr/local/rvm/bin/rvmsudo';
      require => Exec['system-rvm'],
    }
}





