class base::basepkgs (
  $config = undef
) {


  $hiera_config_common = hiera('base::basepkgs::common', undef)

  case $::osfamily {

    'Redhat': {

      case $::operatingsystemmajrelease {
        6: { 
          $hiera_config_release = hiera('base::basepkgs::6', undef)
          $epel_vers = "epel-6"
        }
        5: { 
          $hiera_config_release = hiera('base::basepkgs::5', undef)
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
                  require => Yumrepo['epel']
      }

      package { $hiera_config_release:
                  ensure  => 'installed',
                  require => Yumrepo['epel']
      }

    } # End Redhat
    'Debian': {

      package { $hiera_config_common:
                  ensure  => 'installed',
      }

    } # End Debian

  }

}
