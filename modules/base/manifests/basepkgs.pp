class base::basepkgs (
  $config = undef
) {


  $hiera_config_common = hiera_hash('base::basepkgs::common', undef)

  case $::operatingsystemmajrelease {
    6: { 
      $hiera_config_release = hiera_hash('base::basepkgs::6', undef)
      $epel_vers = "epel-6"
    }
    5: { 
      $hiera_config_release = hiera_hash('base::basepkgs::5', undef)
      $epel_vers = "epel-5"
    }

  }

  package { $hiera_config_common:
              ensure  => 'installed',
              require => Yumerepo['epel']
  }

}
