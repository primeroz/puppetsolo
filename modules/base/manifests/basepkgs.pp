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

  # Enable EPEL repo my mirrors
  yumrepo {
      "epel":
          descr          =>   "Epel Repository for CentOS",
          mirrorlist     =>   "http://mirrors.fedoraproject.org/mirrorlist?repo=${epel_vers}&arch=\$basearch",
          failovermethod =>   "priority",
          gpgcheck       =>   "0",
          enabled        =>   "1";
  }

  package { $hiera_config_common:
              ensure  => 'installed',
              require => Yumerepo['epel']
  }

  package { $hiera_config_release
              ensure  => 'installed',
              require => Yumerepo['epel']
  }

}